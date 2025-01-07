import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/data/dtos/response/now_playing_response_dto.dart';
import 'package:tmdb/data/dtos/response/trending_movie_response_dto.dart';
import 'package:tmdb/data/repos/movies_list/movies_list_repo.dart';
import 'package:tmdb/data/repos/trending/trending_repo.dart';
import 'package:tmdb/features/home/cubit/home_status.dart';

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

      final NowPlayingResponseDto nowPlaying =
          await _moviesListRepo.getNowPlaying();

      emit(
        state.copyWith(
          getHomeDataStatus: GetHomeDataSuccess(
            nowPlaying: nowPlaying,
            trendingMovies: trendingMovies,
          ),
        ),
      );
    } catch (e) {
      emit(state.copyWith(
          getHomeDataStatus: GetHomeDataError('An unexpected error occurred')));
    }
  }

  changeTab(int index) {
    emit(state.copyWith(currentTabIndex: index));
  }
}
