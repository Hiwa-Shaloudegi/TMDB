import 'package:flutter/material.dart';
import 'package:tmdb/common/extensions/num_extension.dart';
import 'package:tmdb/config/consts/app_sizes.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';

class RetryErrorWidget extends StatelessWidget {
  const RetryErrorWidget({
    super.key,
    required this.onRetry,
  });

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.pagePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: theme.colorScheme.error,
              size: 64,
            ),
            16.h,
            Text(
              "Something went wrong!",
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.error,
              ),
              textAlign: TextAlign.center,
            ),
            8.h,
            Text(
              "Please check your connection or try again later.",
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            24.h,
            SizedBox(
              width: size.width * 0.9,
              child: ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "Retry",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
