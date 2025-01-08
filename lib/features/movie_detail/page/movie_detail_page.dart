import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmdb/common/extensions/num_extension.dart';
import 'package:tmdb/common/widgets/dot_loading.dart';
import 'package:tmdb/common/widgets/sliver_main_app_bar.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';
import 'package:tmdb/common/widgets/app_filter_tabbar.dart';
import 'package:tmdb/features/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:tmdb/features/movie_detail/page/widgets/movie_cast_grid_view.dart';
import 'package:tmdb/features/movie_detail/page/widgets/movie_desc_view.dart';
import 'package:tmdb/features/movie_detail/page/widgets/movie_reviews.dart';

class MovieDetailPage extends StatefulWidget {
  final String movieId;

  const MovieDetailPage({super.key, required this.movieId});

  @override
  State createState() => _MovieDaState();
}

class _MovieDaState extends State<MovieDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      initialIndex: 0,
      vsync: this,
    );

    context.read<MovieDetailCubit>().getMovieDetails(id: widget.movieId);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
        builder: (context, state) {
          if (state.getMovieDetailsStatus is GetMovieDetailsLoading) {
            return const Center(
              child: DotLoading(size: 20),
            );
          } else if (state.getMovieDetailsStatus is GetMovieDetailsError) {
            return const Center(
              child: Text('Error'),
            );
          } else if (state.getMovieDetailsStatus is GetMovieDetailsSuccess) {
            final getMovieDetailsStatus =
                (state.getMovieDetailsStatus as GetMovieDetailsSuccess);
            return SafeArea(
              child: DefaultTabController(
                length: 3,
                child: CustomScrollView(
                  slivers: [
                    SliverMainAppBar(
                      title: getMovieDetailsStatus.movieDetail.title ??
                          'Movie Detail',
                      trailing: SvgPicture.asset('assets/icons/heart.svg'),
                    ),
                    16.sh,
                    SliverToBoxAdapter(
                      child: Container(
                        width: double.infinity,
                        height: size.height * 0.3,
                        decoration: BoxDecoration(
                          color: AppColors.shimmerBaseDark,
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(16),
                          ),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              getMovieDetailsStatus.movieDetail.backdropPath ??
                                  '',
                            ),
                            fit: BoxFit.cover,
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
                                      child: SvgPicture.asset(
                                          'assets/icons/star.svg'),
                                    ),
                                    8.w,
                                    Text(
                                      getMovieDetailsStatus
                                          .movieDetail.voteAverage
                                          .toString(),
                                      style: const TextStyle(
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
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                          getMovieDetailsStatus
                                                  .movieDetail.posterPath ??
                                              '',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  16.w,
                                  Container(
                                    width: size.width -
                                        ((size.width * 0.26) + 40 + 16),
                                    height: (size.height * 0.15) / 2,
                                    padding: const EdgeInsets.only(right: 4),
                                    child: Text(
                                      getMovieDetailsStatus.movieDetail.title ??
                                          'No title',
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
                              SvgPicture.asset(
                                  'assets/icons/calendar_blank.svg'),
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
                                '${getMovieDetailsStatus.movieDetail.runtime} Minutes',
                                style: textTheme.labelMedium,
                              ),
                              if (getMovieDetailsStatus.movieDetail.geners !=
                                  null) ...[
                                Text(
                                  '|',
                                  style: textTheme.labelMedium,
                                ),
                                SvgPicture.asset('assets/icons/ticket.svg'),
                                Text(
                                  getMovieDetailsStatus
                                      .movieDetail.geners!.last.name,
                                  style: textTheme.labelMedium,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                    32.sh,
                    PinnedHeaderSliver(
                      child: Container(
                        color: AppColors.backgroundDark,
                        child: AppFilterTabBar(
                          tabController: _tabController,
                          tabs: const [
                            Tab(text: 'About Movie'),
                            Tab(text: 'Reviews'),
                            Tab(text: 'Cast'),
                          ],
                        ),
                      ),
                    ),
                    24.sh,
                    SliverFillRemaining(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          MovieDescView(),
                          MovieReviews(movieId: widget.movieId),
                          MovieCastGridView(movieId: widget.movieId),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
