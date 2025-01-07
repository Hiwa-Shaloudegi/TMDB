import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:tmdb/config/consts/endpoints.dart';
import 'package:tmdb/data/dtos/response/now_playing_response_dto.dart';
import 'package:tmdb/data/dtos/response/popular_response_dto.dart';
import 'package:tmdb/data/dtos/response/top_rated_response_dto.dart';
import 'package:tmdb/data/dtos/response/upcoming_response_dto.dart';

class MoviesListDataSrcRemote {
  final Dio _dio;
  final Logger _logger;

  MoviesListDataSrcRemote(this._dio, this._logger);

  Future<NowPlayingResponseDto> getNowPlaying() async {
    try {
      final response = await _dio.get(Endpoints.nowPlaying);

      if (response.statusCode == 200) {
        return NowPlayingResponseDto.fromJson(response.data);
      } else {
        _logger.e('Failed: ${response.statusCode}');
        throw Exception('Failed to load');
      }
    } catch (e) {
      _logger.e('Failed to modify request: $e');
      throw Exception('An unexpected error occurred');
    }
  }

  Future<UpcomingResponseDto> getUpcoming() async {
    try {
      final response = await _dio.get(Endpoints.upcoming);

      if (response.statusCode == 200) {
        return UpcomingResponseDto.fromJson(response.data);
      } else {
        _logger.e('Failed: ${response.statusCode}');
        throw Exception('Failed to load');
      }
    } catch (e) {
      _logger.e('Failed to modify request: $e');
      throw Exception('An unexpected error occurred');
    }
  }

  Future<TopRatedResponseDto> getTopRated() async {
    try {
      final response = await _dio.get(Endpoints.topRated);

      if (response.statusCode == 200) {
        return TopRatedResponseDto.fromJson(response.data);
      } else {
        _logger.e('Failed: ${response.statusCode}');
        throw Exception('Failed to load');
      }
    } catch (e) {
      _logger.e('Failed to modify request: $e');
      throw Exception('An unexpected error occurred');
    }
  }

  Future<PopularResponseDto> getPopular() async {
    try {
      final response = await _dio.get(Endpoints.popular);

      if (response.statusCode == 200) {
        return PopularResponseDto.fromJson(response.data);
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
