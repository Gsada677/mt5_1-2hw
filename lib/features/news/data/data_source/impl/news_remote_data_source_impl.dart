import 'package:injectable/injectable.dart';
import 'package:mt5_leeon1/features/news/data/data_source/api/news_remote_data_source.dart';
import 'package:mt5_leeon1/features/news/data/entities/news_article_entity.dart';
import 'package:dio/dio.dart';

abstract final class _ApiPath {
  static const String news =
      'v2/everything?q=tesla&from=2026-05-06&sortBy=publishedAt';
  static const String everything = 'v2/everything';
  static const String apiKey = '0ad3cf323e3841ab9ae5bab36cb57b3d';
}

@LazySingleton(as: NewsRemoteDataSource)
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio dio;

  const NewsRemoteDataSourceImpl({@Named('newsDio') required this.dio});
  @override
  Future<List<NewsArticleEntity>> getNews() async {
    final response = await dio.get(
      _ApiPath.news,
      queryParameters: {'apiKey': _ApiPath.apiKey},
    );
    return NewsArticleEntity.fromJsonList(response.data['articles']);
  }

  @override
  Future<List<NewsArticleEntity>> searchNews(String query) async {
    final response = await dio.get(
      _ApiPath.everything,
      queryParameters: {'q': query, 'apiKey': _ApiPath.apiKey},
    );
    return NewsArticleEntity.fromJsonList(response.data['articles']);
  }
}
