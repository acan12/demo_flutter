import 'package:demo_flutter/core/data/data_sources/model/article.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'news_api_service.g.dart';

@RestApi()
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<Article>>> getNewsArticles({
    @Query("apiKey") String ? apiKey,
    @Query("country") String ? country,
    @Query("category") String ? category,
  });
}