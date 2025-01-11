import 'package:tmdb/data/data_src/local/favorites/favorites_data_src_local.dart';
import 'package:tmdb/features/search/models/movie_info_model.dart';

class FavoriteRepo {
  final FavoritesDataSrcLocal _favoriteDataSrcLocal;

  FavoriteRepo(this._favoriteDataSrcLocal);

  Future<MovieInfoModel> addFavorite(MovieInfoModel movie) async {
    try {
      return await _favoriteDataSrcLocal.add(movie);
    } catch (e) {
      throw Exception("Failed to add movie to favorites: $e");
    }
  }

  Future<MovieInfoModel?> removeFavorite(int movieId) async {
    try {
      return await _favoriteDataSrcLocal.remove(movieId);
    } catch (e) {
      throw Exception("Failed to remove movie from favorites: $e");
    }
  }

  Future<List<MovieInfoModel>> getFavorites() async {
    try {
      return await _favoriteDataSrcLocal.getAll();
    } catch (e) {
      throw Exception("Failed to fetch favorite movies: $e");
    }
  }

  Future<bool> isFavorited(int movieId) async {
    return _favoriteDataSrcLocal.isFavorited(movieId);
  }
}
