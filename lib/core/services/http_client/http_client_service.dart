// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:tmdb/config/consts/endpoints.dart';
// import 'package:tmdb/core/services/http_client/api_interceptor.dart';

// final httpServiceProvider = Provider<Dio>((ref) {
//   final apiInterceptor = ref.watch(apiInterceptorProvider);

//   final baseOptions = BaseOptions(
//     baseUrl: Endpoints.tmdbBaseUrl,
//     connectTimeout: const Duration(seconds: 5),
//     receiveTimeout: const Duration(seconds: 5),
//     sendTimeout: const Duration(seconds: 5),
//   );

//   final dio = Dio(baseOptions);

//   dio.interceptors.addAll([
//     apiInterceptor,
//   ]);

//   return dio;
// });


// class HttpClientService {
//   final ApiInterceptor apiInterceptor;
  
//   static const final baseOptions = BaseOptions(
//     baseUrl: Endpoints.tmdbBaseUrl,
//     connectTimeout: const Duration(seconds: 5),
//     receiveTimeout: const Duration(seconds: 5),
//     sendTimeout: const Duration(seconds: 5),
//   );

//   final dio = Dio(baseOptions);

//   dio.interceptors.addAll([
//     apiInterceptor,
//   ]);

//   return dio;
  
// }