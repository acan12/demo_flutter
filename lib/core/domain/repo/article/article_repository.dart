import 'package:demo_flutter/core/domain/entities/article_entity.dart';
import 'package:demo_flutter/core/util/network/data_state.dart';

abstract class ArticleRepository {

  Future<DataState<List<ArticleEntity>>> getNewsArticles();

}