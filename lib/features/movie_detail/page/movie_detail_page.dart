import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmdb/common/extensions/num_extension.dart';
import 'package:tmdb/common/widgets/sliver_main_app_bar.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';
import 'package:tmdb/common/widgets/app_filter_tabbar.dart';
import 'package:tmdb/features/movie_detail/page/widgets/movie_cast_grid_view.dart';
import 'package:tmdb/features/movie_detail/page/widgets/movie_desc_view.dart';
import 'package:tmdb/features/movie_detail/page/widgets/movie_reviews.dart';

class MovieDetailPage extends ConsumerStatefulWidget {
  const MovieDetailPage({super.key});

  @override
  ConsumerState createState() => _MovieDaState();
}

class _MovieDaState extends ConsumerState<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: CustomScrollView(
            slivers: [
              SliverMainAppBar(
                title: 'Detail',
                trailing: SvgPicture.asset('assets/icons/heart.svg'),
              ),
              16.sh,
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                    color: AppColors.shimmerLoadingDark,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        right: 16,
                        bottom: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.containerBannerSurface,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Transform.scale(
                                scale: 1.2,
                                child:
                                    SvgPicture.asset('assets/icons/star.svg'),
                              ),
                              8.w,
                              const Text(
                                '8.2',
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -(size.height * 0.17) / 2,
                        left: 40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: size.width * 0.26,
                              height: size.height * 0.17,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            16.w,
                            Container(
                              width:
                                  size.width - ((size.width * 0.26) + 40 + 16),
                              height: (size.height * 0.15) / 2,
                              padding: const EdgeInsets.only(right: 4),
                              child: Text(
                                "Spiderman No Way Home",
                                style: textTheme.headlineMedium,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Space
              ((size.height * 0.17) / 2).sh,
              32.sh,
              SliverToBoxAdapter(
                child: Center(
                  child: SizedBox(
                    width: size.width * 0.7,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/icons/calendar_blank.svg'),
                        Text(
                          '2021',
                          style: textTheme.labelMedium,
                        ),
                        Text(
                          '|',
                          style: textTheme.labelMedium,
                        ),
                        SvgPicture.asset('assets/icons/clock.svg'),
                        Text(
                          '148 Minutes',
                          style: textTheme.labelMedium,
                        ),
                        Text(
                          '|',
                          style: textTheme.labelMedium,
                        ),
                        SvgPicture.asset('assets/icons/ticket.svg'),
                        Text(
                          'Action',
                          style: textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              32.sh,
              PinnedHeaderSliver(
                child: Container(
                  color: AppColors.backgroundDark,
                  child: const AppFilterTabBar(
                    tabs: [
                      Tab(text: 'About Movie'),
                      Tab(text: 'Reviews'),
                      Tab(text: 'Cast'),
                    ],
                  ),
                ),
              ),
              24.sh,
              const SliverFillRemaining(
                child: TabBarView(
                  children: [
                    MovieDescView(),
                    MovieReviews(),
                    MovieCastGridView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
