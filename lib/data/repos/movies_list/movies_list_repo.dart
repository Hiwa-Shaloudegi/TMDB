import 'package:tmdb/data/data_src/remote/movies_list/movies_list_data_src_remote.dart';
import 'package:tmdb/data/dtos/response/now_playing_response_dto.dart';
import 'package:tmdb/data/dtos/response/popular_response_dto.dart';
import 'package:tmdb/data/dtos/response/top_rated_response_dto.dart';
import 'package:tmdb/data/dtos/response/upcoming_response_dto.dart';

class MoviesListRepo {
  final MoviesListDataSrcRemote _moviesListDataSrcRemote;

  MoviesListRepo(this._moviesListDataSrcRemote);

  Future<NowPlayingResponseDto> getNowPlaying() async {
    try {
      final result = await _moviesListDataSrcRemote.getNowPlaying();
      return result;
    } catch (e) {
      throw Exception('An unexpected error occurred');
    }
  }

  Future<UpcomingResponseDto> getUpcoming() async {
    try {
      final result = await _moviesListDataSrcRemote.getUpcoming();
      return result;
    } catch (e) {
      throw Exception('An unexpected error occurred');
    }
  }

  Future<TopRatedResponseDto> getTopRated() async {
    try {
      final result = await _moviesListDataSrcRemote.getTopRated();
      return result;
    } catch (e) {
      throw Exception('An unexpected error occurred');
    }
  }

  Future<PopularResponseDto> getPopular() async {
    try {
      final result = await _moviesListDataSrcRemote.getPopular();
      return result;
    } catch (e) {
      throw Exception('An unexpected error occurred');
    }
  }
}
