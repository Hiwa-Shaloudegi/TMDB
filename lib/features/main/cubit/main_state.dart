part of 'main_cubit.dart';

class MainState {
  final int navIndex;

  MainState({required this.navIndex});

  MainState copyWith({
    int? navIndex,
  }) {
    return MainState(
      navIndex: navIndex ?? this.navIndex,
    );
  }
}
