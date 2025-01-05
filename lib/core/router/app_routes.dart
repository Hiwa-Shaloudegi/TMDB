import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb/features/favorites/page/favorites_page.dart';
import 'package:tmdb/features/home/pages/home_page.dart';
import 'package:tmdb/features/main/main_page.dart';
import 'package:tmdb/features/movie_detail/page/movie_detail_page.dart';
import 'package:tmdb/features/search/page/search_page.dart';
import 'package:tmdb/features/splash/pages/splash_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        // name: ,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.main,
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
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
});

abstract class AppRoutes {
  static const String splash = '/splash';
  static const String main = '/main';
  static const String home = '/home';
  static const String search = '/search';
  static const String favorites = '/favorites';
  static const String movieDetail = '/movie-detail';
}
