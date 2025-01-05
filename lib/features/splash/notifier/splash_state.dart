enum AsyncStatus { init, loading, success, error }

class SplashState {
  final AsyncStatus splashStatus;

  SplashState({required this.splashStatus});

  SplashState copyWith({
    AsyncStatus? splashStatus,
  }) {
    return SplashState(
      splashStatus: splashStatus ?? this.splashStatus,
    );
  }
}
