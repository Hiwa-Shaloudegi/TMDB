import 'package:flutter/material.dart';
import 'package:tmdb/config/consts/app_sizes.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.pagePadding),
      child: Text(
        "What do you want to watch?",
        style: textTheme.headlineSmall,
      ),
    );
  }
}
