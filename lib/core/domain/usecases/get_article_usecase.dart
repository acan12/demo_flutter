import 'package:demo_flutter/core/domain/entities/article.dart';
import 'package:demo_flutter/core/domain/repo/article/article_repository.dart';
import 'package:demo_flutter/core/domain/usecases/base_usecase.dart';
import 'package:demo_flutter/core/util/network/data_state.dart';

class GetArticleUseCase implements BaseUseCase<DataState<List<ArticleEntity>>, void>{

  final ArticleRepository _articleRepository;
  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}