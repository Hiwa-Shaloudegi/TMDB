import 'package:tmdb/data/data_src/remote/movies/movies_data_src_remote.dart';
import 'package:tmdb/data/dtos/response/movie_cast_response_dto.dart';
import 'package:tmdb/data/dtos/response/movie_details_response_dto.dart';
import 'package:tmdb/data/dtos/response/movie_reviews_response_dto.dart';

class MoviesRepo {
  final MoviesDataSrcRemote _moviesDataSrcRemote;

  MoviesRepo(this._moviesDataSrcRemote);

  Future<MovieDetailsResponseDto> getMovieDetails({required String id}) async {
    try {
      final result = await _moviesDataSrcRemote.getMovieDetails(id: id);
      return result;
    } catch (e) {
      throw Exception('An unexpected error occurred');
    }
  }

  Future<MovieReviewsResponseDto> getMovieReviews({required String id}) async {
    try {
      final result = await _moviesDataSrcRemote.getMovieReviews(id: id);
      return result;
    } catch (e) {
      throw Exception('An unexpected error occurred');
    }
  }

  Future<MovieCastResponseDto> getMovieCast({required String id}) async {
    try {
      final result = await _moviesDataSrcRemote.getMovieCast(id: id);
      return result;
    } catch (e) {
      throw Exception('An unexpected error occurred');
    }
  }
}
