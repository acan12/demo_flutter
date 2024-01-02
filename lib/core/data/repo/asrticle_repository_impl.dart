import 'dart:io';

import 'package:demo_flutter/core/data/data_sources/model/article.dart';
import 'package:demo_flutter/core/data/data_sources/remote/news_api_service.dart';
import 'package:demo_flutter/core/domain/entities/article.dart';
import 'package:demo_flutter/core/domain/repo/article/article_repository.dart';
import 'package:demo_flutter/core/util/network/data_state.dart';

import 'package:dio/dio.dart';
import '../../config.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<Article>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
          apiKey: newsApiKey,
          country: countryQuery,
          category: categoryQuery
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
            DioError(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioErrorType.badResponse,
                requestOptions: httpResponse.response.requestOptions
            )
        );
      }
    } on DioError catch (err) {
      return DataFailed(err);
    }
  }
}
