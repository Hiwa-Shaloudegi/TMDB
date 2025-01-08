part of 'search_cubit.dart';

class SearchState extends Equatable {
  // Status
  final SearchMovieStatus searchMovieStatus;

  const SearchState({required this.searchMovieStatus});

  SearchState copyWith({
    SearchMovieStatus? searchMovieStatus,
  }) {
    return SearchState(
      searchMovieStatus: searchMovieStatus ?? this.searchMovieStatus,
    );
  }

  @override
  List<Object> get props => [searchMovieStatus];
}
