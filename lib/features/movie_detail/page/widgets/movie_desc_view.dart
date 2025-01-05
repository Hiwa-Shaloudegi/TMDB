import 'package:flutter/material.dart';
import 'package:tmdb/config/consts/app_sizes.dart';

class MovieDescView extends StatelessWidget {
  const MovieDescView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.pagePadding),
      child: const Text(
        'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.',
      ),
    );
  }
}
