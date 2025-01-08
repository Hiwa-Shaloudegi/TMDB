import 'package:tmdb/data/data_src/local/genre/genre_data_src_local.dart';
import 'package:tmdb/data/data_src/remote/genre/genre_data_src_remote.dart';
import 'package:tmdb/data/data_src/remote/search/search_data_src_remote.dart';
import 'package:tmdb/features/search/models/genre_model.dart';
import 'package:tmdb/features/search/models/movie_info_model.dart';

class SearchRepo {
  final SearchDataSrcRemote _searchDataSrcRemote;
  final GenreDataSrcRemote _genreDataSrcRemote;
  final GenreDataSrcLocal _genreDataSrcLocal;

  SearchRepo(
    this._searchDataSrcRemote,
    this._genreDataSrcRemote,
    this._genreDataSrcLocal,
  );

  Future<List<MovieInfoModel>> searchMovie({required String query}) async {
    try {
      final searchMovieResponseDto =
          await _searchDataSrcRemote.searchMovie(query: query);

      final genres = await _genreDataSrcLocal.getAllGenres();
      if (genres.isEmpty) {
        final movieGenreListResponseDto =
            await _genreDataSrcRemote.getMovieGenres();
        final List<GenreModel> genreList = movieGenreListResponseDto.genres!
            .map(
              (e) => GenreModel(
                id: e.id!,
                name: e.name!,
              ),
            )
            .toList();
        _genreDataSrcLocal.saveGenreList(genreList);
      }

      List<MovieInfoModel> movieList = searchMovieResponseDto.results!
          .map(
            (e) => MovieInfoModel(
              id: e.id!,
              posterUrl: e.posterPath,
              title: e.title!,
              voteAverage: e.voteAverage,
              releaseDate: e.releaseDate!,
              genre: genres.last,
            ),
          )
          .toList();

      return movieList;
    } catch (e) {
      throw Exception('An unexpected error occurred');
    }
  }
}
