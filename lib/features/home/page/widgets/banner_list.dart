import 'package:flutter/material.dart';
import 'package:tmdb/common/extensions/num_extension.dart';
import 'package:tmdb/config/consts/app_sizes.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';

class BannerList extends StatelessWidget {
  const BannerList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      height: size.height * 0.25,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.pagePadding),
        separatorBuilder: (context, index) => 16.w,
        itemBuilder: (context, index) {
          return Container(
            width: size.width * 0.4,
            decoration: BoxDecoration(
              color: AppColors.shimmerLoadingDark,
              borderRadius: BorderRadius.circular(16),
            ),
          );
        },
      ),
    );
  }
}
