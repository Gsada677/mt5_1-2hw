import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt5_leeon1/core/di/service_locator.dart';
import 'package:mt5_leeon1/features/news/domain/bloc/news_bloc.dart';
import 'package:mt5_leeon1/features/news/ui/NewsTile.dart';

class NewsFavoritePage extends StatelessWidget {
  const NewsFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NewsBloc>()..add(NewsRequestedEvent()),
      child: Builder(
        builder: (context) {
          return Center(
            child: Container(
              padding: const EdgeInsets.all(6),
              width: 400,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Scaffold(
                backgroundColor: Colors.white,
                body: CustomScrollView(
                  slivers: [

                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(12),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('My Favorite', style: TextStyle(
                              color: Color(0xFF202124),
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              height: 1,
                            ),)..animate()
                                .fadeIn()
                                .scale()
                                .move(delay: 300.ms, duration: 600.ms)
                                .blurXY(),
                            SizedBox(height: 24,),
                            TextField(
                              style:  TextStyle(fontSize: 18),
                              decoration:  InputDecoration(
                                hintText: 'Search news...',
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor:  Color(0xFFF7F7F7),
                                contentPadding:  EdgeInsets.symmetric(
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
                          return const SliverToBoxAdapter(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          );
                        }
                        if (state is NewsFailure) {
                          return SliverToBoxAdapter(
                            child: Center(
                              child: Text('Error: ${state.message}'),
                            ),
                          );
                        }
                        if (state is NewsSuccess) {
                          final list = state.news;
                          return SliverPadding(
                            padding: const EdgeInsets.all(10),
                            sliver: SliverGrid(

                              delegate: SliverChildBuilderDelegate((
                                context,
                                index,

                              ) {
                                final news = list[index];
                                return NewsTile(
                                  title: news.title,
                                  desc: news.desc,
                                  urlToImage: news.urlToImage,
                                  publishedAt: news.publishedAt,
                                  author: news.author,
                                );
                              }, childCount: list.length),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 2,
                                    childAspectRatio: 0.65,
                                  ),
                            ),
                          );
                        }
                        return const SliverToBoxAdapter(
                          child: Center(child: Text('News Page')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
