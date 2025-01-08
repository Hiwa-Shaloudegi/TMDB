import 'package:tmdb/features/search/models/movie_info_model.dart';

// SearchMovie
abstract class SearchMovieStatus {}

final class SearchMovieInitial extends SearchMovieStatus {}

final class SearchMovieLoading extends SearchMovieStatus {}

final class SearchMovieSuccess extends SearchMovieStatus {
  final List<MovieInfoModel> movieList;

  SearchMovieSuccess({required this.movieList});
}

final class SearchMovieError extends SearchMovieStatus {
  final String message;
  SearchMovieError(this.message);
}
