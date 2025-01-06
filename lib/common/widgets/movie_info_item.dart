import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tmdb/common/extensions/num_extension.dart';
import 'package:tmdb/config/consts/app_sizes.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';

class MovieInfoItem extends StatelessWidget {
  const MovieInfoItem({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      height: size.height * 0.18,
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.pagePadding),
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          Container(
            width: size.width * 0.3,
            decoration: BoxDecoration(
              color: AppColors.shimmerBaseDark,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          16.w,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Spiderman',
                  style: textTheme.titleMedium,
                ),
                8.h,
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: SvgPicture.asset('assets/icons/star.svg'),
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
                    const Text('2019'),
                  ],
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: SvgPicture.asset('assets/icons/clock.svg'),
                    ),
                    8.w,
                    const Text('139 mintes'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
