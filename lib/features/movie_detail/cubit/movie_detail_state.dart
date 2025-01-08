part of 'movie_detail_cubit.dart';

class MovieDetailState extends Equatable {
  // Status
  final GetMovieDetailsStatus getMovieDetailsStatus;
  final GetMovieReviewsStatus getMovieReviewsStatus;
  final GetMovieCastStatus getMovieCastStatus;

  const MovieDetailState({
    required this.getMovieDetailsStatus,
    required this.getMovieReviewsStatus,
    required this.getMovieCastStatus,
  });

  MovieDetailState copyWith({
    GetMovieDetailsStatus? getMovieDetailsStatus,
    GetMovieReviewsStatus? getMovieReviewsStatus,
    GetMovieCastStatus? getMovieCastStatus,
  }) {
    return MovieDetailState(
      getMovieDetailsStatus:
          getMovieDetailsStatus ?? this.getMovieDetailsStatus,
      getMovieReviewsStatus:
          getMovieReviewsStatus ?? this.getMovieReviewsStatus,
      getMovieCastStatus: getMovieCastStatus ?? this.getMovieCastStatus,
    );
  }

  @override
  List<Object> get props => [
        getMovieDetailsStatus,
        getMovieReviewsStatus,
        getMovieCastStatus,
      ];
}

// getMovieDetails
abstract class GetMovieDetailsStatus {}

final class GetMovieDetailsInitial extends GetMovieDetailsStatus {}

final class GetMovieDetailsLoading extends GetMovieDetailsStatus {}

final class GetMovieDetailsSuccess extends GetMovieDetailsStatus {
  final MovieDetail movieDetail;

  GetMovieDetailsSuccess(this.movieDetail);
}

final class GetMovieDetailsError extends GetMovieDetailsStatus {
  final String message;

  GetMovieDetailsError(this.message);
}

// getMovieReviews
abstract class GetMovieReviewsStatus {}

final class GetMovieReviewsInitial extends GetMovieReviewsStatus {}

final class GetMovieReviewsLoading extends GetMovieReviewsStatus {}

final class GetMovieReviewsSuccess extends GetMovieReviewsStatus {
  final List<Review> reviewes;

  GetMovieReviewsSuccess({required this.reviewes});
}

final class GetMovieReviewsError extends GetMovieReviewsStatus {
  final String message;

  GetMovieReviewsError(this.message);
}

// getMovieCast
abstract class GetMovieCastStatus {}

final class GetMovieCastInitial extends GetMovieCastStatus {}

final class GetMovieCastLoading extends GetMovieCastStatus {}

final class GetMovieCastSuccess extends GetMovieCastStatus {
  final List<CastModel> casts;

  GetMovieCastSuccess({required this.casts});
}

final class GetMovieCastError extends GetMovieCastStatus {
  final String message;

  GetMovieCastError(this.message);
}
