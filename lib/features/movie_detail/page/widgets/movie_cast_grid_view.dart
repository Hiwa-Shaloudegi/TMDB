import 'package:flutter/material.dart';
import 'package:tmdb/common/extensions/num_extension.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';

class MovieCastGridView extends StatefulWidget {
  const MovieCastGridView({super.key, required this.movieId});

  final String movieId;

  @override
  State<MovieCastGridView> createState() => _MovieCastGridViewState();
}

class _MovieCastGridViewState extends State<MovieCastGridView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: size.height * 0.2,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              width: size.width * 0.25,
              height: size.width * 0.25,
              decoration: BoxDecoration(
                color: AppColors.shimmerBaseDark,
                shape: BoxShape.circle,
              ),
            ),
            16.h,
            const Text(
              'Tom Holland',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        );
      },
    );
  }
}
