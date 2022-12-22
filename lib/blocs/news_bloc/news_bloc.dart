import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/data/repository/articles.dart';
import 'package:news_app/models/article.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsLoading()) {
    on<NewsEvent>((event, emit) async {
      if (event is FetchNews) {
        emit(NewsLoading());
        try {
          List<Article> article =
              await ArticlesRespository.getArticles(event.index);
          emit(NewsLoadingSuccess(articles: article));
        } catch (e) {
          emit(NewsLoadingError(error: e.toString()));
        }
      }
    });
  }
}
