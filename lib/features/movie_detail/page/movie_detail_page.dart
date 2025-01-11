import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb/common/extensions/num_extension.dart';
import 'package:tmdb/common/widgets/dot_loading.dart';
import 'package:tmdb/common/widgets/sliver_main_app_bar.dart';
import 'package:tmdb/config/consts/app_sizes.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';
import 'package:tmdb/common/widgets/app_filter_tabbar.dart';
import 'package:tmdb/features/favorites/cubit/favorites_cubit.dart';
import 'package:tmdb/features/favorites/cubit/favorites_status.dart';
import 'package:tmdb/features/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:tmdb/features/movie_detail/page/widgets/movie_cast_grid_view.dart';
import 'package:tmdb/features/movie_detail/page/widgets/movie_desc_view.dart';
import 'package:tmdb/features/movie_detail/page/widgets/movie_reviews.dart';
import 'package:tmdb/features/search/models/genre_model.dart';
import 'package:tmdb/features/search/models/movie_info_model.dart';

class MovieDetailPage extends StatefulWidget {
  final String movieId;

  const MovieDetailPage({
    super.key,
    required this.movieId,
  });

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

    // TODO:
    context
        .read<FavoritesCubit>()
        .checkIfFavorited(movieId: int.parse(widget.movieId));

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

            return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverMainAppBar(
                    title: getMovieDetailsStatus.movieDetail.title ??
                        'Movie Detail',
                    trailing: GestureDetector(
                      onTap: () {
                        final movieDetail = getMovieDetailsStatus.movieDetail;

                        final movieIngoGenres = movieDetail.geners!
                            .map(
                              (e) => GenreModel(id: e.id, name: e.name),
                            )
                            .toList();

                        final MovieInfoModel movieInfo = MovieInfoModel(
                          id: movieDetail.id,
                          title: movieDetail.title!,
                          posterUrl: movieDetail.posterPath,
                          voteAverage: movieDetail.voteAverage,
                          releaseDate: '',
                          genres: movieIngoGenres,
                        );
                        context
                            .read<FavoritesCubit>()
                            .toggleFavorite(movieInfo);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(AppSizes.pagePadding),
                        child: BlocBuilder<FavoritesCubit, FavoritesState>(
                          buildWhen: (p, c) =>
                              p.checkIfFavoritedStatus !=
                              c.checkIfFavoritedStatus,
                          builder: (context, state) {
                            final checkIfFavoritedStatus =
                                state.checkIfFavoritedStatus;

                            if (checkIfFavoritedStatus
                                is CheckIfFavoritedSuccess) {
                              if (checkIfFavoritedStatus.isFavorited) {
                                return SvgPicture.asset(
                                    'assets/icons/heart.svg');
                              } else {
                                return SvgPicture.asset(
                                    'assets/icons/heart_empty.svg');
                              }
                            } else if (checkIfFavoritedStatus
                                is CheckIfFavoritedLoading) {
                              return const DotLoading(size: 15);
                            }
                            return SvgPicture.asset(
                                'assets/icons/heart_empty.svg');
                          },
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        // Poster and Title Section
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: double.infinity,
                              height: size.height * 0.3,
                              decoration: BoxDecoration(
                                color: AppColors.shimmerBaseDark,
                                borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(16),
                                ),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: getMovieDetailsStatus
                                        .movieDetail.backdropPath ??
                                    '',
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.shimmerBaseDark,
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      alignment: FractionalOffset.center,
                                      image: imageProvider,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Skeleton.ignore(
                                  child: Icon(Icons.error),
                                ),
                              ),
                            ),
                            ...[
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
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: getMovieDetailsStatus
                                                .movieDetail.posterPath ??
                                            '',
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.shimmerBaseDark,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              alignment:
                                                  FractionalOffset.center,
                                              image: imageProvider,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Skeleton.ignore(
                                          child: Icon(Icons.error),
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
                                        getMovieDetailsStatus
                                                .movieDetail.title ??
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
                          ],
                        ),
                        SizedBox(height: ((size.height * 0.17) / 2) + 32),

                        Center(
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
                                Text('|', style: textTheme.labelMedium),
                                SvgPicture.asset('assets/icons/clock.svg'),
                                Text(
                                  '${getMovieDetailsStatus.movieDetail.runtime} Minutes',
                                  style: textTheme.labelMedium,
                                ),
                                if (getMovieDetailsStatus.movieDetail.geners !=
                                    null) ...[
                                  Text('|', style: textTheme.labelMedium),
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
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
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
                ];
              },
              body: TabBarView(
                controller: _tabController,
                children: [
                  const MovieDescView(),
                  MovieReviews(movieId: widget.movieId),
                  MovieCastGridView(movieId: widget.movieId),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
