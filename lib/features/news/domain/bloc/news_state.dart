part of 'news_bloc.dart';

@immutable
sealed class NewsState extends Equatable{
  const NewsState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class NewsInitial extends NewsState {
  const NewsInitial();
}
final class NewsLoading extends NewsState {
  const NewsLoading();
}
final class NewsSuccess extends NewsState {
  const NewsSuccess(this.news);
  final List<NewsArticleModel> news;
  @override
  // TODO: implement props
  List<Object?> get props => [news];
}
final class NewsFailure extends NewsState {
  const NewsFailure(this.message);
  final String message;
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}