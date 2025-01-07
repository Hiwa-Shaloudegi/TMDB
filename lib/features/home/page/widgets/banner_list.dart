import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb/common/extensions/num_extension.dart';
import 'package:tmdb/config/consts/app_sizes.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';
import 'package:tmdb/features/home/cubit/home_cubit.dart';
import 'package:tmdb/features/home/cubit/home_status.dart';
import 'package:tmdb/features/home/page/widgets/banner_item.dart';

class BannerList extends StatelessWidget {
  const BannerList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      height: size.height * 0.25,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Skeletonizer(
            enabled: state.getHomeDataStatus is GetHomeDataLoading,
            effect: ShimmerEffect(
              baseColor: AppColors.shimmerBaseDark,
              highlightColor: AppColors.shimmerHighlightDark,
            ),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSizes.pagePadding),
              separatorBuilder: (context, index) => 16.w,
              itemBuilder: (context, index) {
                final String? imageUrl;
                if (state.getHomeDataStatus is GetHomeDataSuccess) {
                  final bannerModel =
                      (state.getHomeDataStatus as GetHomeDataSuccess)
                          .trendingMovies
                          .results![index];
                  imageUrl = bannerModel.posterPath;
                } else {
                  imageUrl = '';
                }
                return Skeleton.leaf(
                  enabled: state.getHomeDataStatus is GetHomeDataLoading,
                  child: BannerItem(imageUrl: imageUrl!),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
