part of 'news_bloc.dart';

@immutable
sealed class NewsEvent extends Equatable{
const NewsEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];


}
 class NewsRequestedEvent extends NewsEvent {
 const NewsRequestedEvent();
}
final class SearchNewsEvent extends NewsEvent{
  final String NewsName;

  SearchNewsEvent({required this.NewsName});
  @override
  // TODO: implement props
  List<Object?> get props => [NewsName];

}
