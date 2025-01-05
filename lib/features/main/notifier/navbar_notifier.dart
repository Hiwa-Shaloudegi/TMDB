import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb/features/favorites/page/favorites_page.dart';
import 'package:tmdb/features/home/pages/home_page.dart';
import 'package:tmdb/features/search/page/search_page.dart';

final navIndexValueProvider = StateProvider<int>((ref) {
  return 0;
});

final mainNavItemsProvider = Provider<List<Widget>>((ref) {
  return [
    HomePage(),
    SearchPage(),
    FavoritesPage(),
  ];
});
