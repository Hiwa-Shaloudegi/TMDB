import 'package:tmdb/data/dtos/response/now_playing_response_dto.dart';
import 'package:tmdb/data/dtos/response/trending_movie_response_dto.dart';

// GetHomeData
abstract class GetHomeDataStatus {}

final class GetHomeDataInitial extends GetHomeDataStatus {}

final class GetHomeDataLoading extends GetHomeDataStatus {}

final class GetHomeDataSuccess extends GetHomeDataStatus {
  final NowPlayingResponseDto nowPlaying;
  final TrendingMoviesResponseDto trendingMovies;

  GetHomeDataSuccess({
    required this.nowPlaying,
    required this.trendingMovies,
  });
}

final class GetHomeDataError extends GetHomeDataStatus {
  final String message;
  GetHomeDataError(this.message);
}
