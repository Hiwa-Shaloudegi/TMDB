part of 'favorites_cubit.dart';

class FavoritesState extends Equatable {
  // Status
  final GetFavoritesStatus getFavoritesStatus;
  final ToggleFavoritesStatus toggleFavoritesStatus;
  final CheckIfFavoritedStatus checkIfFavoritedStatus;

  const FavoritesState({
    required this.getFavoritesStatus,
    required this.toggleFavoritesStatus,
    required this.checkIfFavoritedStatus,
  });

  FavoritesState copyWith({
    GetFavoritesStatus? getFavoritesStatus,
    ToggleFavoritesStatus? toggleFavoritesStatus,
    CheckIfFavoritedStatus? checkIfFavoritedStatus,
  }) {
    return FavoritesState(
      getFavoritesStatus: getFavoritesStatus ?? this.getFavoritesStatus,
      toggleFavoritesStatus:
          toggleFavoritesStatus ?? this.toggleFavoritesStatus,
      checkIfFavoritedStatus:
          checkIfFavoritedStatus ?? this.checkIfFavoritedStatus,
    );
  }

  @override
  List<Object> get props => [
        getFavoritesStatus,
        toggleFavoritesStatus,
        checkIfFavoritedStatus,
      ];
}
