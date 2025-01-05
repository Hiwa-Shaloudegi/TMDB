import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb/core/services/logger/logger.dart';
import 'package:tmdb/features/splash/notifier/splash_state.dart';

final splashControllerProvider =
    NotifierProvider<SplashController, SplashState>(
  () => SplashController(),
);

class SplashController extends Notifier<SplashState> {
  @override
  SplashState build() {
    return SplashState(splashStatus: AsyncStatus.init);
  }

  init() async {
    final logger = ref.watch(loggerProvider);

    state = state.copyWith(splashStatus: AsyncStatus.loading);
    logger.i("here: loading");
    try {
      await Future.delayed(const Duration(seconds: 3));

      /// initilization...
      state = state.copyWith(splashStatus: AsyncStatus.success);
      logger.i("here: success");
    } catch (e) {
      state = state.copyWith(splashStatus: AsyncStatus.error);
    }
  }
}
