import 'package:demo_flutter/core/data/data_sources/remote/news_api_service.dart';
import 'package:demo_flutter/core/data/repo/article_repository_impl.dart';
import 'package:demo_flutter/core/domain/repo/article/article_repository.dart';
import 'package:demo_flutter/core/domain/usecases/get_article_usecase.dart';
import 'package:demo_flutter/core/ui/bloc/article/article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
final sl = GetIt.instance;
Future<void> initializeDependencies() async {

  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerFactory<ArticleBloc>(()=>ArticleBloc(sl()));
}