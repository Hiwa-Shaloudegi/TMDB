import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark);

  changeTheme() {
    state == ThemeMode.dark ? emit(ThemeMode.light) : emit(ThemeMode.dark);
  }
}
