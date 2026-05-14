import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mt5_leeon1/features/news/domain/repo/news_repository.dart';
import 'package:mt5_leeon1/features/news/domain/usecases/get_news_use_cases.dart';

import '../model/news_article_model.dart';

part 'news_event.dart';
part 'news_state.dart';
@injectable
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({required this.getNewsUseCases,}) : super(const NewsInitial()) {
    on<NewsRequestedEvent>(_onNewsRequester);
    on<SearchNewsEvent>(_searchNews);


  }
  final GetNewsUseCases getNewsUseCases;
  Future<void>_onNewsRequester(
      NewsRequestedEvent event,
      Emitter<NewsState>emit,

      )async{
    emit(const NewsLoading());
    try{
      final news=await getNewsUseCases.call();
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
      final news=await getNewsUseCases.search(event.NewsName);
      emit(NewsSuccess(news));
    }catch(error){
      emit(NewsFailure(error.toString()));
    }

  }

}
