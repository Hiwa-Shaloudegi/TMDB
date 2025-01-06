import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:tmdb/config/consts/endpoints.dart';
import 'package:tmdb/data/dtos/response/now_playing_response_dto.dart';

class MoviesListDataSrcRemote {
  final Dio dio;
  final Logger logger;

  MoviesListDataSrcRemote(this.dio, this.logger);

  Future<NowPlayingResponseDto> getNowPlaying() async {
    try {
      final response = await dio.get(Endpoints.nowPlaying);

      if (response.statusCode == 200) {
        logger.i(response.data);
        return NowPlayingResponseDto.fromJson(response.data);
      } else {
        throw Exception('Failed to load');
      }
    } catch (e) {
      logger.e('Failed to modify request: $e');
      throw Exception('An unexpected error occurred');
    }
  }
}
