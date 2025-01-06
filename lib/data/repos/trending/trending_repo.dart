import 'package:tmdb/data/data_src/remote/trending/trending_data_src.dart';
import 'package:tmdb/data/dtos/response/trending_movie_response_dto.dart';

class TrendingRepo {
  final TrendingDataSrc _trendingDataSrc;

  TrendingRepo(this._trendingDataSrc);

  Future<TrendingMoviesResponseDto> getTrendingMovies() async {
    try {
      final result = await _trendingDataSrc.getTrendingMovies();
      return result;
    } catch (e) {
      throw Exception('An unexpected error occurred');
    }
  }
}
