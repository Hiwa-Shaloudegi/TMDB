import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb/data/repos/movies/movies_repo.dart';
import 'package:tmdb/features/movie_detail/model/movie_detail.dart';
import 'package:tmdb/features/movie_detail/model/review.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final MoviesRepo _moviesRepo;

  MovieDetailCubit(this._moviesRepo)
      : super(
          MovieDetailState(
            getMovieDetailsStatus: GetMovieDetailsInitial(),
            getMovieReviewsStatus: GetMovieReviewsInitial(),
          ),
        );

  getMovieDetails({required String id}) async {
    emit(
      state.copyWith(
        getMovieDetailsStatus: GetMovieDetailsLoading(),
      ),
    );

    try {
      final movieDetailsResponseDto = await _moviesRepo.getMovieDetails(id: id);
      final movieDetail = MovieDetail(
        id: movieDetailsResponseDto.id!,
        title: movieDetailsResponseDto.title,
        voteAverage: double.parse(
          movieDetailsResponseDto.voteAverage!.toStringAsFixed(2),
        ),
        backdropPath: movieDetailsResponseDto.backdropPath,
        posterPath: movieDetailsResponseDto.posterPath,
        overview: movieDetailsResponseDto.overview,
        runtime: movieDetailsResponseDto.runtime!,
        geners: movieDetailsResponseDto.genres!
            .map(
              (e) => Gener(
                id: e.id!,
                name: e.name!,
              ),
            )
            .toList(),
      );

      emit(
        state.copyWith(
          getMovieDetailsStatus: GetMovieDetailsSuccess(movieDetail),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getMovieDetailsStatus:
              GetMovieDetailsError('An unexpected error occurred'),
        ),
      );
    }
  }

  getMovieReviews({required String id}) async {
    emit(state.copyWith(getMovieReviewsStatus: GetMovieReviewsLoading()));

    try {
      final movieReviewsResponseDto = await _moviesRepo.getMovieReviews(id: id);
      final List<Review> reviewes = movieReviewsResponseDto.results!
          .map(
            (e) => Review(
              authorName: e.author!,
              content: e.content!,
              rating: e.authorDetails!.rating != null
                  ? double.parse(e.authorDetails!.rating!.toStringAsFixed(2))
                  : null,
              avatarUrl: e.authorDetails!.avatarPath != null
                  ? e.authorDetails?.avatarPath
                  : null,
            ),
          )
          .toList();

      emit(
        state.copyWith(
          getMovieReviewsStatus: GetMovieReviewsSuccess(reviewes: reviewes),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getMovieReviewsStatus:
              GetMovieReviewsError('An unexpected error occurred'),
        ),
      );
    }
  }
}
