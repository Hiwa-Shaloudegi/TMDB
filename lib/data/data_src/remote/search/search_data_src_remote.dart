import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:tmdb/config/consts/endpoints.dart';
import 'package:tmdb/data/dtos/response/search_movie_response_dto.dart';

class SearchDataSrcRemote {
  final Dio _dio;
  final Logger _logger;

  SearchDataSrcRemote(this._dio, this._logger);

  Future<SearchMovieResponseDto> searchMovie({required String query}) async {
    try {
      final response = await _dio.get(
        Endpoints.searchMovie,
        queryParameters: {
          'query': query,
        },
      );

      if (response.statusCode == 200) {
        return SearchMovieResponseDto.fromJson(response.data);
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
