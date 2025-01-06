import 'package:dio/dio.dart';
import 'package:tmdb/config/consts/endpoints.dart';
import 'package:tmdb/core/services/http_client/api_interceptor.dart';

class HttpClientService {
  final ApiInterceptor apiInterceptor;
  late final Dio dio;

  HttpClientService(this.apiInterceptor) {
    final baseOptions = BaseOptions(
      baseUrl: Endpoints.tmdbBaseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(seconds: 5),
    );

    dio = Dio(baseOptions);

    dio.interceptors.addAll([
      apiInterceptor,
    ]);
  }
}
