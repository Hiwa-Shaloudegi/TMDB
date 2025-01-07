import 'package:flutter/material.dart';
import 'package:tmdb/config/consts/app_sizes.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';

class AppFilterTabBar extends StatefulWidget {
  final List<Widget> tabs;
  final TabController tabController;

  const AppFilterTabBar({
    super.key,
    required this.tabs,
    required this.tabController,
  });

  @override
  State<AppFilterTabBar> createState() => _AppFilterTabBarState();
}

class _AppFilterTabBarState extends State<AppFilterTabBar> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return TabBar(
      controller: widget.tabController,
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.pagePadding),
      tabAlignment: TabAlignment.start,
      labelPadding: const EdgeInsets.symmetric(horizontal: 14),
      labelColor: Colors.white,
      dividerColor: Colors.transparent,
      indicatorColor: AppColors.secondary,
      indicatorWeight: 5,
      labelStyle: textTheme.bodyLarge,
      unselectedLabelStyle: textTheme.bodyMedium,
      indicatorSize: TabBarIndicatorSize.label,
      isScrollable: true,
      physics: const ClampingScrollPhysics(),
      tabs: widget.tabs,
    );
  }
}
