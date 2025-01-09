import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb/common/extensions/num_extension.dart';
import 'package:tmdb/common/widgets/movie_info_item.dart';
import 'package:tmdb/core/router/app_routes.dart';
import 'package:tmdb/features/search/models/movie_info_model.dart';

class SliverMovieInfoItemList extends StatelessWidget {
  const SliverMovieInfoItemList({
    super.key,
    required this.movieList,
  });

  final List<MovieInfoModel> movieList;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: movieList.length,
      separatorBuilder: (context, index) => 24.h,
      itemBuilder: (context, index) {
        var movie = movieList[index];

        return GestureDetector(
          onTap: () => context.push(
            AppRoutes.movieDetail.replaceFirst(
              ':id',
              movie.id.toString(),
            ),
          ),
          child: MovieInfoItem(movie: movie),
        );
      },
    );
  }
}
