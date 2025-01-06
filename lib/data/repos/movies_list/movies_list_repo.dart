import 'package:tmdb/data/data_src/remote/movies_list/movies_list_data_src_remote.dart';
import 'package:tmdb/data/dtos/response/now_playing_response_dto.dart';

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
}
