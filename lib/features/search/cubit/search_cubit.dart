import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb/data/repos/search/search_repo.dart';
import 'package:tmdb/features/search/cubit/search_status.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;

  SearchCubit(this._searchRepo)
      : super(SearchState(searchMovieStatus: SearchMovieInitial()));

  searchMovie({required String query}) async {
    emit(state.copyWith(searchMovieStatus: SearchMovieLoading()));

    try {
      final movies = await _searchRepo.searchMovie(query: query);

      emit(state.copyWith(
          searchMovieStatus: SearchMovieSuccess(movieList: movies)));
    } catch (e) {
      emit(state.copyWith(
          searchMovieStatus: SearchMovieError('An unexpected error occurred')));
    }
  }

  claerSearchResults() {
    emit(state.copyWith(searchMovieStatus: SearchMovieInitial()));
  }
}
