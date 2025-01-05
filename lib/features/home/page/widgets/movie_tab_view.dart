import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';
import 'package:tmdb/core/router/app_routes.dart';

class MovieTabView extends StatelessWidget {
  const MovieTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 11 / 16,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => context.push(AppRoutes.movieDetail),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.shimmerLoadingDark,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        );
      },
    );
  }
}
