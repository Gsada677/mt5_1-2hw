import 'package:injectable/injectable.dart';
import 'package:mt5_leeon1/features/news/domain/model/news_article_model.dart';
import 'package:mt5_leeon1/features/news/domain/repo/news_repository.dart';
@injectable
class GetNewsUseCases {
  final NewsRepository newsRepository;

  GetNewsUseCases({required this.newsRepository});
  Future<List<NewsArticleModel>>call(){
    return newsRepository.getNews();
  }
Future<List<NewsArticleModel>>search(String query){
    return newsRepository.searchNews('');
}

}