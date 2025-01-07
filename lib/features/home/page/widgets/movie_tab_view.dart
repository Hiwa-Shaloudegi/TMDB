import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';
import 'package:tmdb/core/router/app_routes.dart';
import 'package:tmdb/features/home/cubit/home_cubit.dart';
import 'package:tmdb/features/home/cubit/home_status.dart';
import 'package:tmdb/features/home/models/movie_poster.dart';

class MovieTabView extends StatelessWidget {
  const MovieTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SliverSkeletonizer(
          enabled: state.getTabMoviesStatus is GetTabMoviesLoading ||
              state.getHomeDataStatus is GetHomeDataLoading,
          effect: ShimmerEffect(
            baseColor: AppColors.shimmerBaseDark,
            highlightColor: AppColors.shimmerHighlightDark,
          ),
          child: SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 11 / 16,
              crossAxisSpacing: 10,
              mainAxisSpacing: 12,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              MoviePoster? movie =
                  state.getTabMoviesStatus is GetTabMoviesSuccess
                      ? (state.getTabMoviesStatus as GetTabMoviesSuccess)
                          .moviePosters[index]
                      : null;

              return GestureDetector(
                onTap: () => context.push(
                  AppRoutes.movieDetail.replaceFirst(
                    ':id',
                    movie!.id.toString(),
                  ),
                ),
                child: Skeleton.leaf(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.shimmerBaseDark,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: movie == null
                        ? null
                        : CachedNetworkImage(
                            imageUrl: movie.poster,
                            fit: BoxFit.cover,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
