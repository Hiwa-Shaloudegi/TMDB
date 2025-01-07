import 'package:tmdb/features/splash/cubit/splash_status.dart';

class SplashState {
  final InitStatus initStatus;

  SplashState({required this.initStatus});

  SplashState copyWith({
    InitStatus? initStatus,
  }) {
    return SplashState(
      initStatus: initStatus ?? this.initStatus,
    );
  }
}
