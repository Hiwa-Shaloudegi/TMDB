import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:tmdb/config/consts/endpoints.dart';
import 'package:tmdb/core/di/di.dart';
import 'package:tmdb/data/dtos/response/trending_movie_response_dto.dart';

class TrendingDataSrc {
  final Dio _dio;

  TrendingDataSrc(this._dio);

  Future<TrendingMoviesResponseDto> getTrendingMovies() async {
    try {
      final response = await _dio.get(Endpoints.trending);

      if (response.statusCode == 200) {
        return TrendingMoviesResponseDto.fromJson(response.data);
      } else {
        throw Exception('Failed to load');
      }
    } catch (e) {
      getIt<Logger>().e('Failed to modify request: $e');
      throw Exception('An unexpected error occurred');
    }
  }
}
