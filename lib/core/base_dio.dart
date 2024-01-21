
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';

import 'config.dart';

class BaseDio {

  Dio getDio() {
    Dio dio = Dio(
        BaseOptions(contentType: "application/json", baseUrl: newsApiBaseUrl));
    dio.interceptors
      ..add(LogInterceptor(requestBody: true))
      ..add(ChuckerDioInterceptor());
    return dio;
  }
}
