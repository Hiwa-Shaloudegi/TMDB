import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:tmdb/config/consts/endpoints.dart';
import 'package:tmdb/data/dtos/response/movie_cast_response_dto.dart';
import 'package:tmdb/data/dtos/response/movie_details_response_dto.dart';
import 'package:tmdb/data/dtos/response/movie_reviews_response_dto.dart';

class MoviesDataSrcRemote {
  final Dio _dio;
  final Logger _logger;

  MoviesDataSrcRemote(this._dio, this._logger);

  Future<MovieDetailsResponseDto> getMovieDetails({required String id}) async {
    try {
      final url = Endpoints.movieDetails.replaceAll('{movie_id}', id);
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        return MovieDetailsResponseDto.fromJson(response.data);
      } else {
        _logger.e('Failed: ${response.statusCode}');
        throw Exception('Failed to load');
      }
    } catch (e) {
      _logger.e('Failed to modify request: $e');
      throw Exception('An unexpected error occurred');
    }
  }

  Future<MovieReviewsResponseDto> getMovieReviews({required String id}) async {
    try {
      final url = Endpoints.movieReviews.replaceAll('{movie_id}', id);
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        return MovieReviewsResponseDto.fromJson(response.data);
      } else {
        _logger.e('Failed: ${response.statusCode}');
        throw Exception('Failed to load');
      }
    } catch (e) {
      _logger.e('Failed to modify request: $e');
      throw Exception('An unexpected error occurred');
    }
  }

  Future<MovieCastResponseDto> getMovieCast({required String id}) async {
    try {
      final url = Endpoints.movieCast.replaceAll('{movie_id}', id);
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        return MovieCastResponseDto.fromJson(response.data);
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
