part of 'headline_news_cubit.dart';

abstract class HeadlineNewsState extends Equatable {
  @override
  List<Object> get props => [];

  const HeadlineNewsState();
}

class HeadlineNewsLoading extends HeadlineNewsState {}

class HeadlineNewsFailed extends HeadlineNewsState {
  final String message;

  const HeadlineNewsFailed(this.message);

  @override
  List<Object> get props => [message];
}

class HeadlineNewsSuccess extends HeadlineNewsState {
  final List<Article> headlineNews;

  HeadlineNewsSuccess({required this.headlineNews});

  @override
  List<Object> get props => [headlineNews];
}
