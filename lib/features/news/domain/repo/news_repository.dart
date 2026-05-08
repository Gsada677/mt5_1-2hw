import 'package:mt5_leeon1/features/news/domain/model/news_article_model.dart';

abstract class NewsRepository {
  Future<List<NewsArticleModel>>getNews();
  Future<List<NewsArticleModel>>searchNews(String query);
}