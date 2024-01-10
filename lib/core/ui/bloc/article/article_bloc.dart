import 'package:bloc/bloc.dart';
import 'package:demo_flutter/core/domain/usecases/get_article_usecase.dart';
import 'package:demo_flutter/core/ui/bloc/article/article_event.dart';
import 'package:demo_flutter/core/ui/bloc/article/article_state.dart';
import 'package:demo_flutter/core/util/network/data_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  ArticleBloc(this._getArticleUseCase) : super(const ArticleLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<ArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ArticleDone(dataState.data!));
    }

    if(dataState is DataFailed){
      print(dataState.error!.message);
      emit(
        ArticleError(dataState.error!)
      );
    }
  }
}
