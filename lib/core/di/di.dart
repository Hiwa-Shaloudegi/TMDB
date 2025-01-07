import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:tmdb/config/consts/endpoints.dart';
import 'package:tmdb/core/services/http_client/api_interceptor.dart';
import 'package:tmdb/data/data_src/remote/movies_list/movies_list_data_src_remote.dart';
import 'package:tmdb/data/data_src/remote/trending/trending_data_src.dart';
import 'package:tmdb/data/repos/movies_list/movies_list_repo.dart';
import 'package:tmdb/data/repos/trending/trending_repo.dart';

final getIt = GetIt.instance;

void setup() {
  initServices();
  initDataSources();
  initRepos();
}

void initServices() {
  // Logger
  getIt.registerSingleton(
    Logger(
      printer: PrettyPrinter(
        // methodCount: 2, // Number of method calls to be displayed
        // errorMethodCount: 8, // Number of method calls if stacktrace is provided
        lineLength: 120,
        colors: true,
        printEmojis: true,
      ),
    ),
  );

  // ApiInterceptor
  getIt.registerSingleton<ApiInterceptor>(ApiInterceptor());

  // Dio
  getIt.registerLazySingleton<Dio>(
    () {
      final baseOptions = BaseOptions(
        baseUrl: Endpoints.tmdbBaseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5),
      );

      final dio = Dio(baseOptions);

      dio.interceptors.addAll([
        getIt<ApiInterceptor>(),
      ]);

      return dio;
    },
  );
}

void initDataSources() {
  getIt.registerSingleton<MoviesListDataSrcRemote>(
    MoviesListDataSrcRemote(
      getIt(),
      getIt(),
    ),
  );

  getIt.registerSingleton<TrendingDataSrc>(
    TrendingDataSrc(
      getIt(),
      getIt(),
    ),
  );
}

void initRepos() {
  getIt.registerSingleton<MoviesListRepo>(
    MoviesListRepo(
      getIt(),
    ),
  );
  getIt.registerSingleton<TrendingRepo>(
    TrendingRepo(
      getIt(),
    ),
  );
}
