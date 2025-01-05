import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tmdb/config/consts/secure_storage_keys.dart';
import 'package:tmdb/core/services/secure_storage/secure_storage_service.dart';

final apiInterceptorProvider = Provider<ApiInterceptor>((ref) {
  final secureStorage = ref.watch(secureStorageServiceProvider);

  return ApiInterceptor(secureStorage);
});

class ApiInterceptor extends Interceptor {
  final FlutterSecureStorage _secureStorage;

  ApiInterceptor(this._secureStorage);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken =
        await _secureStorage.read(key: SecureStorageKeys.accessToken);
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';

    handler.next(options);

    super.onRequest(options, handler);
  }

  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) async {
  //   if (err.response?.statusCode == 401) {
  //     final refreshToken =
  //         await _secureStorage.read(key: SecureStorageKeys.refreshToken);

  //     try {
  //       final response = await dio.post(
  //         'http://...',
  //         data: {
  //           'refreshToken': refreshToken,
  //         },
  //       );
  //     } catch (e) {}
  //   }
  //   super.onError(err, handler);
  // }
}
