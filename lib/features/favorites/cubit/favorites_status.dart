import 'package:tmdb/features/search/models/movie_info_model.dart';

// GetFavorites
abstract class GetFavoritesStatus {}

final class GetFavoritesInitial extends GetFavoritesStatus {}

final class GetFavoritesLoading extends GetFavoritesStatus {}

final class GetFavoritesSuccess extends GetFavoritesStatus {
  final List<MovieInfoModel> favorites;

  GetFavoritesSuccess({required this.favorites});
}

final class GetFavoritesError extends GetFavoritesStatus {
  final String message;

  GetFavoritesError(this.message);
}

// AddFavorite
abstract class ToggleFavoritesStatus {}

final class ToggleFavoritesInitial extends ToggleFavoritesStatus {}

final class ToggleFavoritesLoading extends ToggleFavoritesStatus {}

final class ToggleFavoritesSuccess extends ToggleFavoritesStatus {
  final MovieInfoModel movie;

  ToggleFavoritesSuccess({required this.movie});
}

final class ToggleFavoritesError extends ToggleFavoritesStatus {
  final String message;

  ToggleFavoritesError(this.message);
}

// CheckIfFavorited
abstract class CheckIfFavoritedStatus {}

final class CheckIfFavoritedInitial extends CheckIfFavoritedStatus {}

final class CheckIfFavoritedLoading extends CheckIfFavoritedStatus {}

final class CheckIfFavoritedSuccess extends CheckIfFavoritedStatus {
  final bool isFavorited;

  CheckIfFavoritedSuccess({required this.isFavorited});
}

final class CheckIfFavoritedError extends CheckIfFavoritedStatus {
  final String message;

  CheckIfFavoritedError(this.message);
}
