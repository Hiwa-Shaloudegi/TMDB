part of 'home_cubit.dart';

class HomeState extends Equatable {
  final int currentTabIndex;

  // Status
  final GetHomeDataStatus getHomeDataStatus;
  final GetTabMoviesStatus getTabMoviesStatus;

  const HomeState({
    required this.currentTabIndex,
    required this.getHomeDataStatus,
    required this.getTabMoviesStatus,
  });

  HomeState copyWith({
    int? currentTabIndex,
    GetHomeDataStatus? getHomeDataStatus,
    GetTabMoviesStatus? getTabMoviesStatus,
  }) {
    return HomeState(
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
      getHomeDataStatus: getHomeDataStatus ?? this.getHomeDataStatus,
      getTabMoviesStatus: getTabMoviesStatus ?? this.getTabMoviesStatus,
    );
  }

  @override
  List<Object?> get props => [
        currentTabIndex,
        getHomeDataStatus,
        getTabMoviesStatus,
      ];
}
