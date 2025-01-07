part of 'movie_detail_cubit.dart';

class MovieDetailState extends Equatable {
  // Status
  final GetMovieDetailsStatus getMovieDetailsStatus;
  final GetMovieReviewsStatus getMovieReviewsStatus;

  const MovieDetailState({
    required this.getMovieDetailsStatus,
    required this.getMovieReviewsStatus,
  });

  MovieDetailState copyWith({
    GetMovieDetailsStatus? getMovieDetailsStatus,
    GetMovieReviewsStatus? getMovieReviewsStatus,
  }) {
    return MovieDetailState(
      getMovieDetailsStatus:
          getMovieDetailsStatus ?? this.getMovieDetailsStatus,
      getMovieReviewsStatus:
          getMovieReviewsStatus ?? this.getMovieReviewsStatus,
    );
  }

  @override
  List<Object> get props => [
        getMovieDetailsStatus,
        getMovieReviewsStatus,
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

final class GetMovieReviewsSuccess extends GetMovieReviewsStatus {}

final class GetMovieReviewsError extends GetMovieReviewsStatus {
  final String message;

  GetMovieReviewsError(this.message);
}
