import 'package:mt5_leeon1/core/di/service_locator.dart';
import 'package:mt5_leeon1/features/news/data/data_source/api/news_remote_data_source.dart';
import 'package:mt5_leeon1/features/news/domain/bloc/news_bloc.dart';
import 'package:mt5_leeon1/features/news/domain/model/news_article_model.dart';
import 'package:mt5_leeon1/features/news/domain/repo/news_repository.dart';

class NewsRepoImpl implements NewsRepository{
  final NewsRemoteDataSource newsRemoteDataSource;

  NewsRepoImpl({required this.newsRemoteDataSource});
  @override
  Future<List<NewsArticleModel>> getNews() async{
    final result=await newsRemoteDataSource.getNews();
    return result.map((entity)
    =>entity.fromEntityToModel()).toList();
  }

  @override
  Future<List<NewsArticleModel>> searchNews(String query)async {
    final allNews=await getIt<NewsRepository>().getNews();
    final filtered=allNews.where(
            (n)=>
                n.title.toLowerCase().contains(query.toLowerCase())
    ).toList();

    return searchNews(query);
  }

}