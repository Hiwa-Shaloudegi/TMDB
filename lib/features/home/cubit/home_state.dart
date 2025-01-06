part of 'home_cubit.dart';

class HomeState extends Equatable {
  final GetHomeDataStatus getHomeDataStatus;

  const HomeState({required this.getHomeDataStatus});

  HomeState copyWith({
    GetHomeDataStatus? getHomeDataStatus,
  }) {
    return HomeState(
      getHomeDataStatus: getHomeDataStatus ?? this.getHomeDataStatus,
    );
  }

  @override
  List<Object?> get props => [getHomeDataStatus];
}
