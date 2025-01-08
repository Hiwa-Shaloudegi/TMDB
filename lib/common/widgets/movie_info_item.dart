import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tmdb/common/extensions/num_extension.dart';
import 'package:tmdb/config/consts/app_sizes.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';
import 'package:tmdb/features/search/models/movie_info_model.dart';

class MovieInfoItem extends StatelessWidget {
  const MovieInfoItem({
    super.key,
    required this.movie,
  });

  final MovieInfoModel movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      height: size.height * 0.18,
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.pagePadding),
      child: Row(
        children: [
          Container(
            width: size.width * 0.3,
            decoration: BoxDecoration(
              color: AppColors.shimmerBaseDark,
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: CachedNetworkImageProvider(movie.posterUrl!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          16.w,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  movie.title,
                  style: textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                4.h,
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: SvgPicture.asset('assets/icons/star.svg'),
                    ),
                    8.w,
                    Text(
                      movie.voteAverage.toString(),
                      style: const TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: SvgPicture.asset('assets/icons/ticket.svg'),
                    ),
                    8.w,
                    const Text('Action'),
                  ],
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child:
                          SvgPicture.asset('assets/icons/calendar_blank.svg'),
                    ),
                    8.w,
                    Text(movie.releaseDate),
                  ],
                ),
                // Row(
                //   children: [
                //     Transform.scale(
                //       scale: 1.2,
                //       child: SvgPicture.asset('assets/icons/clock.svg'),
                //     ),
                //     8.w,
                //     const Text('139 mintes'),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
