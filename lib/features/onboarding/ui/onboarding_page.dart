import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mt5_leeon1/core/router/app_router.gr.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_OnboardingContent> _pages = const [
    _OnboardingContent(
      icon: Icons.newspaper_rounded,
      title: 'Новости каждый день',
      description:
          'Читайте свежие материалы из разных источников и быстро находите важные события.',
      color: Color(0xFF2F80ED),
      accentColor: Color(0xFF27AE60),
    ),
    _OnboardingContent(
      icon: Icons.manage_search_rounded,
      title: 'Поиск и избранное',
      description:
          'Ищите новости по теме, сохраняйте интересные статьи и возвращайтесь к ним позже.',
      color: Color(0xFFEB5757),
      accentColor: Color(0xFFF2C94C),
    ),
  ];

  bool get _isLastPage => _currentPage == _pages.length - 1;

  void _nextPage() {
    if (_isLastPage) {
      context.router.replace(const NewsRouter());
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 28),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => context.router.replace(const NewsRouter()),
                  child: const Text('Пропустить'),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                  },
                  itemBuilder: (context, index) {
                    return _OnboardingSlide(content: _pages[index]);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                  (index) => _OnboardingIndicator(
                    isActive: index == _currentPage,
                    color: _pages[_currentPage].color,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: _nextPage,
                  style: FilledButton.styleFrom(
                    backgroundColor: _pages[_currentPage].color,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(_isLastPage ? 'Начать' : 'Далее'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingSlide extends StatelessWidget {
  const _OnboardingSlide({required this.content});

  final _OnboardingContent content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 210,
          height: 210,
          decoration: BoxDecoration(
            color: content.color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                color: content.accentColor.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(36),
              ),
              child: Icon(content.icon, size: 72, color: content.color),
            ),
          ),
        ),
        const SizedBox(height: 48),
        Text(
          content.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w800,
            color: const Color(0xFF151820),
          ),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Text(
            content.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.45,
              color: const Color(0xFF646B78),
            ),
          ),
        ),
      ],
    );
  }
}

class _OnboardingIndicator extends StatelessWidget {
  const _OnboardingIndicator({required this.isActive, required this.color});

  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      width: isActive ? 28 : 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isActive ? color : const Color(0xFFD6DAE2),
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }
}

class _OnboardingContent {
  const _OnboardingContent({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.accentColor,
  });

  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final Color accentColor;
}
