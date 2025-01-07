import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/data/dtos/response/now_playing_response_dto.dart';
import 'package:tmdb/data/dtos/response/popular_response_dto.dart';
import 'package:tmdb/data/dtos/response/top_rated_response_dto.dart';
import 'package:tmdb/data/dtos/response/trending_movie_response_dto.dart';
import 'package:tmdb/data/dtos/response/upcoming_response_dto.dart';
import 'package:tmdb/data/repos/movies_list/movies_list_repo.dart';
import 'package:tmdb/data/repos/trending/trending_repo.dart';
import 'package:tmdb/features/home/cubit/home_status.dart';
import 'package:tmdb/features/home/models/movie_poster.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final TrendingRepo _trendingRepo;
  final MoviesListRepo _moviesListRepo;

  HomeCubit({
    required TrendingRepo trendingRepo,
    required MoviesListRepo moviesListRepo,
  })  : _moviesListRepo = moviesListRepo,
        _trendingRepo = trendingRepo,
        super(
          HomeState(
            currentTabIndex: 0,
            getHomeDataStatus: GetHomeDataInitial(),
            getTabMoviesStatus: GetTabMoviesInitial(),
          ),
        );

  getHomeData() async {
    emit(state.copyWith(getHomeDataStatus: GetHomeDataLoading()));

    try {
      final TrendingMoviesResponseDto trendingMovies =
          await _trendingRepo.getTrendingMovies();

      changeTab(state.currentTabIndex);

      emit(
        state.copyWith(
          getHomeDataStatus: GetHomeDataSuccess(
            trendingMovies: trendingMovies,
          ),
        ),
      );
    } catch (e) {
      emit(state.copyWith(
          getHomeDataStatus: GetHomeDataError('An unexpected error occurred')));
    }
  }

  changeTab(int index) async {
    emit(state.copyWith(currentTabIndex: index));
    emit(state.copyWith(getTabMoviesStatus: GetTabMoviesLoading()));

    List<MoviePoster> movies = [];
    try {
      if (state.currentTabIndex == 0) {
        final NowPlayingResponseDto nowPlaying =
            await _moviesListRepo.getNowPlaying();

        for (var dto in nowPlaying.results!) {
          movies.add(
            MoviePoster(poster: dto.posterPath ?? ''),
          );
        }
      } else if (state.currentTabIndex == 1) {
        final UpcomingResponseDto upcoming =
            await _moviesListRepo.getUpcoming();

        for (var dto in upcoming.results!) {
          movies.add(
            MoviePoster(poster: dto.posterPath ?? ''),
          );
        }
      } else if (state.currentTabIndex == 2) {
        final TopRatedResponseDto topRated =
            await _moviesListRepo.getTopRated();

        for (var dto in topRated.results!) {
          movies.add(
            MoviePoster(poster: dto.posterPath ?? ''),
          );
        }
      } else if (state.currentTabIndex == 3) {
        final PopularResponseDto popular = await _moviesListRepo.getPopular();

        for (var dto in popular.results!) {
          movies.add(
            MoviePoster(poster: dto.posterPath ?? ''),
          );
        }
      }

      emit(
        state.copyWith(
          getTabMoviesStatus: GetTabMoviesSuccess(moviePosters: movies),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getTabMoviesStatus: GetTabMoviesError(
            'An unexpected error occurred',
          ),
        ),
      );
    }
  }
}
