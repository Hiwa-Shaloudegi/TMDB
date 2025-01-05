import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';
import 'package:tmdb/features/favorites/page/favorites_page.dart';
import 'package:tmdb/features/home/page/home_page.dart';
import 'package:tmdb/features/main/cubit/main_cubit.dart';
import 'package:tmdb/features/main/widgets/svg_nav_icon.dart';
import 'package:tmdb/features/search/page/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainSkeletonState();
}

class _MainSkeletonState extends State<MainPage> {
  final screens = const [
    HomePage(),
    SearchPage(),
    FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: IndexedStack(
            index: state.navIndex,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.navIndex,
            backgroundColor: AppColors.backgroundDark,
            selectedItemColor: AppColors.secondary,
            unselectedItemColor: AppColors.unselectedLabelLight,
            onTap: (value) => context.read<MainCubit>().changeNavIndex(value),
            items: [
              BottomNavigationBarItem(
                icon: SvgNavIcon(
                  'assets/icons/home.svg',
                  isSelected: state.navIndex == 0,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgNavIcon(
                  'assets/icons/nav_search.svg',
                  isSelected: state.navIndex == 1,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: SvgNavIcon(
                  'assets/icons/nav_heart.svg',
                  isSelected: state.navIndex == 2,
                ),
                label: 'Favorites',
              ),
            ],
          ),
        );
      },
    );
  }
}
