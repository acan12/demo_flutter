import 'package:demo_flutter/core/domain/entities/article.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class ArticleState extends Equatable {
  final List<ArticleEntity> ? articles;
  final DioError ? error;

  const ArticleState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

class ArticleLoading extends ArticleState {
  const ArticleLoading();
}

class ArticleDone extends ArticleState {
  const ArticleDone(List<ArticleEntity> article): super(articles: article);
}

class ArticleError extends ArticleState {
  const ArticleError(DioError error): super(error: error);
}
