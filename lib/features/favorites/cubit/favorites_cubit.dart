import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:tmdb/data/repos/favorites/favorite_repo.dart';
import 'package:tmdb/features/favorites/cubit/favorites_status.dart';
import 'package:tmdb/features/search/models/movie_info_model.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoriteRepo _favoriteRepo;
  final Logger _logger;

  FavoritesCubit({required Logger logger, required FavoriteRepo favoriteRepo})
      : _favoriteRepo = favoriteRepo,
        _logger = logger,
        super(
          FavoritesState(
            getFavoritesStatus: GetFavoritesInitial(),
            toggleFavoritesStatus: ToggleFavoritesInitial(),
            checkIfFavoritedStatus: CheckIfFavoritedInitial(),
          ),
        );

  getFavorites() async {
    emit(state.copyWith(getFavoritesStatus: GetFavoritesLoading()));

    try {
      final List<MovieInfoModel> favorites = await _favoriteRepo.getFavorites();

      emit(
        state.copyWith(
          getFavoritesStatus: GetFavoritesSuccess(
            favorites: favorites,
          ),
        ),
      );
    } catch (e) {
      _logger.e(e.toString());

      emit(
        state.copyWith(
          getFavoritesStatus: GetFavoritesError('An unexpected error occurred'),
        ),
      );
    }
  }

  toggleFavorite(MovieInfoModel movie) async {
    final checkIfFavoritedStatus = state.checkIfFavoritedStatus;
    emit(state.copyWith(toggleFavoritesStatus: ToggleFavoritesLoading()));
    late MovieInfoModel? savedOrRemovedMovie;

    try {
      if (checkIfFavoritedStatus is CheckIfFavoritedSuccess &&
          checkIfFavoritedStatus.isFavorited) {
        // Remove from favorites
        emit(state.copyWith(
            checkIfFavoritedStatus:
                CheckIfFavoritedSuccess(isFavorited: false)));
        savedOrRemovedMovie = await _favoriteRepo.removeFavorite(movie.id);

        /// Updating the list of favorites after removing
        final getFavoritesStatus = state.getFavoritesStatus;
        if (getFavoritesStatus is GetFavoritesSuccess) {
          List<MovieInfoModel> favs = getFavoritesStatus.favorites;
          favs.removeWhere(
            (e) => e.id == movie.id,
          );
        }
      } else {
        // Add to favorites
        emit(state.copyWith(
            checkIfFavoritedStatus:
                CheckIfFavoritedSuccess(isFavorited: true)));

        savedOrRemovedMovie = await _favoriteRepo.addFavorite(movie);

        /// Updating the list of favorites after adding
        final getFavoritesStatus = state.getFavoritesStatus;
        if (getFavoritesStatus is GetFavoritesSuccess) {
          List<MovieInfoModel> favs = getFavoritesStatus.favorites;
          favs.insert(0, movie);
        }
      }

      emit(
        state.copyWith(
          toggleFavoritesStatus:
              ToggleFavoritesSuccess(movie: savedOrRemovedMovie!),
        ),
      );
    } catch (e) {
      _logger.e(e.toString());

      emit(
        state.copyWith(
          toggleFavoritesStatus:
              ToggleFavoritesError('Failed to add movie to favorites'),
        ),
      );
    }
  }

  checkIfFavorited({required int movieId}) async {
    emit(state.copyWith(checkIfFavoritedStatus: CheckIfFavoritedLoading()));

    try {
      final isFavorited = await _favoriteRepo.isFavorited(movieId);

      emit(
        state.copyWith(
          checkIfFavoritedStatus:
              CheckIfFavoritedSuccess(isFavorited: isFavorited),
        ),
      );
    } catch (e) {
      _logger.e(e.toString());
      emit(
        state.copyWith(
          checkIfFavoritedStatus:
              CheckIfFavoritedError('An unexpected error occurred'),
        ),
      );
    }
  }
}
