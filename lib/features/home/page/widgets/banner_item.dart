import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      width: size.width * 0.4,
      decoration: BoxDecoration(
        color: AppColors.shimmerBaseDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        // placeholder: (context, url) =>
        // CupertinoActivityIndicator(
        //   radius: 16,
        //   color: Colors.white,
        // ),
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
    );
  }
}
