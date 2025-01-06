import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/app.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';
import 'package:tmdb/config/theme/cubit/theme_cubit.dart';
import 'package:tmdb/core/di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.primary,
    ),
  );

  setup();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: const App(),
    ),
  );
}
