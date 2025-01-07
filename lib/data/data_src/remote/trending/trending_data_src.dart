import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:tmdb/config/consts/endpoints.dart';
import 'package:tmdb/data/dtos/response/trending_movie_response_dto.dart';

class TrendingDataSrc {
  final Dio _dio;
  final Logger _logger;

  TrendingDataSrc(this._dio, this._logger);

  Future<TrendingMoviesResponseDto> getTrendingMovies() async {
    try {
      final response = await _dio.get(Endpoints.trending);

      if (response.statusCode == 200) {
        return TrendingMoviesResponseDto.fromJson(response.data);
      } else {
        _logger.e('Failed: ${response.statusCode}');

        throw Exception('Failed to load');
      }
    } catch (e) {
      _logger.e('Failed to modify request: $e');
      throw Exception('An unexpected error occurred');
    }
  }
}
