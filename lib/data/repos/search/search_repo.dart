import 'package:tmdb/data/data_src/remote/search/search_data_src_remote.dart';
import 'package:tmdb/data/dtos/response/search_movie_response_dto.dart';

class SearchRepo {
  final SearchDataSrcRemote _searchDataSrcRemote;

  SearchRepo(this._searchDataSrcRemote);

  Future<SearchMovieResponseDto> searchMovie({required String query}) async {
    try {
      final result = await _searchDataSrcRemote.searchMovie(query: query);
      return result;
    } catch (e) {
      throw Exception('An unexpected error occurred');
    }
  }
}
