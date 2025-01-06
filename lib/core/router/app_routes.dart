import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb/core/di/di.dart';
import 'package:tmdb/features/favorites/page/favorites_page.dart';
import 'package:tmdb/features/home/cubit/home_cubit.dart';
import 'package:tmdb/features/home/page/home_page.dart';
import 'package:tmdb/features/main/cubit/main_cubit.dart';
import 'package:tmdb/features/main/main_page.dart';
import 'package:tmdb/features/movie_detail/page/movie_detail_page.dart';
import 'package:tmdb/features/search/page/search_page.dart';
import 'package:tmdb/features/splash/bloc/splash_cubit.dart';
import 'package:tmdb/features/splash/pages/splash_page.dart';

abstract class AppRoutes {
  static const String splash = '/splash';
  static const String main = '/main';
  static const String home = '/home';
  static const String search = '/search';
  static const String favorites = '/favorites';
  static const String movieDetail = '/movie-detail';

  static final goRouter = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => BlocProvider(
          create: (context) => SplashCubit()..init(),
          child: const SplashPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.main,
        builder: (context, state) => BlocProvider(
          create: (context) => MainCubit(),
          child: const MainPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(
            moviesListRepo: getIt(),
            trendingRepo: getIt(),
          ), //..getHomeData(),
          child: const HomePage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.search,
        builder: (context, state) => const SearchPage(),
      ),
      GoRoute(
        path: AppRoutes.favorites,
        builder: (context, state) => const FavoritesPage(),
      ),
      GoRoute(
        path: AppRoutes.movieDetail,
        builder: (context, state) => const MovieDetailPage(),
      ),
    ],
  );
}
