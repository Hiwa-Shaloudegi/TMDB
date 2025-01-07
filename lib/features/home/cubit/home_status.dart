import 'package:tmdb/data/dtos/response/trending_movie_response_dto.dart';
import 'package:tmdb/features/home/models/movie_poster.dart';

// GetHomeData
abstract class GetHomeDataStatus {}

final class GetHomeDataInitial extends GetHomeDataStatus {}

final class GetHomeDataLoading extends GetHomeDataStatus {}

final class GetHomeDataSuccess extends GetHomeDataStatus {
  final TrendingMoviesResponseDto trendingMovies;

  GetHomeDataSuccess({
    required this.trendingMovies,
  });
}

final class GetHomeDataError extends GetHomeDataStatus {
  final String message;
  GetHomeDataError(this.message);
}

// GetTabMovies
abstract class GetTabMoviesStatus {}

final class GetTabMoviesInitial extends GetTabMoviesStatus {}

final class GetTabMoviesLoading extends GetTabMoviesStatus {}

final class GetTabMoviesSuccess extends GetTabMoviesStatus {
  final List<MoviePoster> moviePosters;

  GetTabMoviesSuccess({required this.moviePosters});
}

final class GetTabMoviesError extends GetTabMoviesStatus {
  final String message;
  GetTabMoviesError(this.message);
}
