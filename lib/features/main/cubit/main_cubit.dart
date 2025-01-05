import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState(navIndex: 0));

  changeNavIndex(int index) {
    emit(state.copyWith(navIndex: index));
  }
}
