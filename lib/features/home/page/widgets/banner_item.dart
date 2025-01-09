import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';
import 'package:tmdb/core/router/app_routes.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({
    super.key,
    required this.id,
    required this.imageUrl,
  });

  final int id;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: () => context.push(
        AppRoutes.movieDetail.replaceFirst(
          ':id',
          id.toString(),
        ),
      ),
      child: Container(
        width: size.width * 0.4,
        decoration: BoxDecoration(
          color: AppColors.shimmerBaseDark,
          borderRadius: BorderRadius.circular(16),
        ),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          errorWidget: (context, url, error) => const Skeleton.ignore(
            child: Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
