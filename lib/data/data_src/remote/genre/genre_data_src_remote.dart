import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:tmdb/config/consts/endpoints.dart';
import 'package:tmdb/data/dtos/response/movie_genre_list_response_dto.dart';

class GenreDataSrcRemote {
  final Dio _dio;
  final Logger _logger;

  GenreDataSrcRemote(this._dio, this._logger);

  Future<MovieGenreListResponseDto> getMovieGenres() async {
    try {
      final response = await _dio.get(Endpoints.movieGenreList);

      if (response.statusCode == 200) {
        return MovieGenreListResponseDto.fromJson(response.data);
      } else {
        _logger.e('Status Code: ${response.statusCode}');
        throw Exception('Failed to load genres');
      }
    } catch (e) {
      _logger.e(e.toString());
      throw Exception('Failed to load genres');
    }
  }
}
