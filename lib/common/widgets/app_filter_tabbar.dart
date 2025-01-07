import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/config/consts/app_sizes.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';
import 'package:tmdb/features/home/cubit/home_cubit.dart';

class AppFilterTabBar extends StatefulWidget {
  final List<Widget> tabs;

  const AppFilterTabBar({super.key, required this.tabs});

  @override
  State<AppFilterTabBar> createState() => _AppFilterTabBarState();
}

class _AppFilterTabBarState extends State<AppFilterTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 4,
      initialIndex: 0,
      vsync: this,
    );

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        context.read<HomeCubit>().changeTab(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return TabBar(
      controller: _tabController,
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
