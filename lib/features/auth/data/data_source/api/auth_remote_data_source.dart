import 'package:mt5_leeon1/features/news/data/entities/news_article_entity.dart';

abstract class AuthRemoteDataSource {
  Future<bool>auth(String login,String password);
}
