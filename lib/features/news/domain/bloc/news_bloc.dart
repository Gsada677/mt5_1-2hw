import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mt5_leeon1/features/news/domain/repo/news_repository.dart';

import '../model/news_article_model.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({required this.newsRepository}) : super(const NewsInitial()) {
    on<NewsRequestedEvent>(_onNewsRequester);
    on<SearchNewsEvent>(_searchNews);


  }
  final NewsRepository newsRepository;
  Future<void>_onNewsRequester(
      NewsRequestedEvent event,
      Emitter<NewsState>emit,

      )async{
    emit(const NewsLoading());
    try{
      final news=await newsRepository.getNews();
      emit(NewsSuccess(news));
    }catch(error){
      emit(NewsFailure(error.toString()));
    }

  }
  Future<void>_searchNews(
      SearchNewsEvent event,
      Emitter<NewsState>emit,

      )async{
    emit(const NewsLoading());
    try{
      final news=await newsRepository.searchNews(event.NewsName);
      emit(NewsSuccess(news));
    }catch(error){
      emit(NewsFailure(error.toString()));
    }

  }

}
