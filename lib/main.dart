import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tmdb/app.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';
import 'package:tmdb/config/theme/cubit/theme_cubit.dart';
import 'package:tmdb/core/di/di.dart';
import 'package:tmdb/features/favorites/cubit/favorites_cubit.dart';
import 'package:tmdb/features/search/models/genre_model.dart';
import 'package:tmdb/features/search/models/movie_info_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.primary,
    ),
  );

  // Load .env file
  await dotenv.load(fileName: ".env");

  // Hive setup
  await Hive.initFlutter();
  Hive.registerAdapter(MovieInfoModelAdapter());
  Hive.registerAdapter(GenreModelAdapter());

  setupDepends();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => FavoritesCubit(
            favoriteRepo: getIt(),
            logger: getIt(),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}
