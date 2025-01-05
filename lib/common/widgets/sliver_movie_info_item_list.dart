import 'package:flutter/material.dart';
import 'package:tmdb/common/extensions/num_extension.dart';
import 'package:tmdb/common/widgets/movie_info_item.dart';

class SliverMovieInfoItemList extends StatelessWidget {
  const SliverMovieInfoItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 3,
      separatorBuilder: (context, index) => 16.h,
      itemBuilder: (context, index) {
        return const MovieInfoItem();
      },
    );
  }
}
