import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:tmdb/config/consts/endpoints.dart';
import 'package:tmdb/data/dtos/response/now_playing_response_dto.dart';

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
}
