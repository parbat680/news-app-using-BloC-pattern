part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsState {}

class NewsLoadingSuccess extends NewsState {
  final List<Article> articles;

  NewsLoadingSuccess({required this.articles});
}

class NewsLoadingError extends NewsState {
  final String error;

  NewsLoadingError({required this.error});
}
