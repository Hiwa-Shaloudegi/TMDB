import 'package:flutter/material.dart';
import 'package:tmdb/common/extensions/num_extension.dart';
import 'package:tmdb/config/consts/app_sizes.dart';
import 'package:tmdb/features/home/page/widgets/banner_list.dart';
import 'package:tmdb/features/home/page/widgets/header_text.dart';
import 'package:tmdb/common/widgets/app_filter_tabbar.dart';
import 'package:tmdb/features/home/page/widgets/movie_tab_view.dart';
import 'package:tmdb/common/widgets/search_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          initialIndex: 0,
          child: CustomScrollView(
            slivers: [
              24.sh,
              const SliverToBoxAdapter(
                child: HeaderText(),
              ),
              24.sh,
              const SliverToBoxAdapter(
                child: SearchField(isEnabled: false),
              ),
              24.sh,
              const SliverToBoxAdapter(
                child: BannerList(),
              ),
              48.sh,
              const SliverToBoxAdapter(
                child: AppFilterTabBar(
                  tabs: [
                    Tab(text: 'Now playing'),
                    Tab(text: 'Upcoming'),
                    Tab(text: 'Top rated'),
                    Tab(text: 'Popular'),
                  ],
                ),
              ),
              16.sh,
              const SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.pagePadding),
                sliver: MovieTabView(),
              ),
              16.sh,
            ],
          ),
        ),
      ),
    );
  }
}
