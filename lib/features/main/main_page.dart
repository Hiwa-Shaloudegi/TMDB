import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';
import 'package:tmdb/features/main/notifier/navbar_notifier.dart';
import 'package:tmdb/features/main/widgets/svg_nav_icon.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainSkeletonState();
}

class _MainSkeletonState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    final navIndex = ref.watch(navIndexValueProvider);
    final screens = ref.watch(mainNavItemsProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: IndexedStack(
        index: navIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex,
        backgroundColor: AppColors.backgroundDark,
        selectedItemColor: AppColors.secondary,
        unselectedItemColor: AppColors.unselectedLabelLight,
        onTap: (value) =>
            ref.read(navIndexValueProvider.notifier).state = value,
        items: [
          BottomNavigationBarItem(
            icon:
                SvgNavIcon('assets/icons/home.svg', isSelected: navIndex == 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgNavIcon('assets/icons/nav_search.svg',
                isSelected: navIndex == 1),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgNavIcon('assets/icons/nav_heart.svg',
                isSelected: navIndex == 2),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
