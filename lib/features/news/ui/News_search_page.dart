import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt5_leeon1/core/di/service_locator.dart';
import 'package:mt5_leeon1/features/news/domain/bloc/news_bloc.dart';
import 'package:mt5_leeon1/features/news/domain/model/news_article_model.dart';
import 'package:mt5_leeon1/features/news/ui/NewsDetail.dart';

@RoutePage()
class NewsSearchPage extends StatefulWidget {
  const NewsSearchPage({super.key});

  @override
  State<NewsSearchPage> createState() => _NewsSearchPageState();
}

class _NewsSearchPageState extends State<NewsSearchPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NewsBloc>()..add(const NewsRequestedEvent()),
      child: Builder(
        builder: (context) {
          return Center(
            child: Container(
              width: 400,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 28, 20, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Hi Jorge,',
                                style: TextStyle(
                                  color: Color(0xFF202124),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                  height: 1,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Let's find something new...",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 24),
                              TextField(
                                style: const TextStyle(fontSize: 16),
                                decoration: InputDecoration(
                                  hintText: 'Search news...',
                                  prefixIcon: const Icon(Icons.search),
                                  filled: true,
                                  fillColor: const Color(0xFFF7F7F7),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                onChanged: (value) {
                                  context.read<NewsBloc>().add(
                                    SearchNewsEvent(NewsName: value),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      BlocBuilder<NewsBloc, NewsState>(
                        builder: (context, state) {
                          if (state is NewsLoading) {
                            return const SliverFillRemaining(
                              hasScrollBody: false,
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }

                          if (state is NewsFailure) {

                            return SliverFillRemaining(
                              hasScrollBody: false,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: Text(
                                    'Error: ${state.message}',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            );
                          }

                          if (state is NewsSuccess) {
                            final trending = state.news.take(20).toList();
                            final newReleases = state.news
                                .skip(20)
                                .take(20)
                                .toList();
                            final fallback = state.news.reversed
                                .take(20)
                                .toList();

                            return SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _ExploreSection(
                                      title: 'Trending',
                                      articles: trending,
                                    ),
                                    _ExploreSection(
                                      title: 'New releases',
                                      articles: newReleases.isEmpty
                                          ? fallback
                                          : newReleases,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }

                          return const SliverFillRemaining(
                            hasScrollBody: false,
                            child: Center(child: Text('News Page')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ExploreSection extends StatelessWidget {
  const _ExploreSection({required this.title, required this.articles});

  final String title;
  final List<NewsArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 26),
        const Divider(height: 1, indent: 20, endIndent: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 14),
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF202124),
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        SizedBox(
          height: 236,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: articles.length,
            separatorBuilder: (context, index) => const SizedBox(width: 18),
            itemBuilder: (context, index) {
              return _ExploreArticleCard(article: articles[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _ExploreArticleCard extends StatelessWidget {
  const _ExploreArticleCard({required this.article});

  final NewsArticleModel article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => NewsDetailPage(
              author: article.author,
              title: article.title,
              desc: article.desc,
              urlToImage: article.urlToImage,
              publishedAt: article.publishedAt,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 132,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: const Color(0xFFEDEDED),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                article.urlToImage,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return  Center(
                    child: Icon(
                      Icons.article_outlined,
                      color: Color(0xFF8E8E8E),
                      size: 42,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Text(
              article.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF222222),
                fontSize: 13,
                fontWeight: FontWeight.w600,
                height: 1.15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
