import 'package:bloc/bloc.dart';
import 'package:demo_flutter/core/domain/usecases/get_article.dart';
import 'package:demo_flutter/core/ui/bloc/article/article_event.dart';
import 'package:demo_flutter/core/ui/bloc/article/article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  ArticleBloc(this._getArticleUseCase) : super(const ArticleLoading()){
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<ArticleState> emit) {

  }
}