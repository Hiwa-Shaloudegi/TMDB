import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/features/splash/cubit/splash_state.dart';
import 'package:tmdb/features/splash/cubit/splash_status.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState(initStatus: InitInitial()));

  void init() async {
    emit(SplashState(initStatus: InitLoading()));

    await Future.delayed(const Duration(seconds: 2));

    emit(SplashState(initStatus: InitSuccess()));
  }
}
