import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/common/extensions/num_extension.dart';
import 'package:tmdb/features/movie_detail/cubit/movie_detail_cubit.dart';

class MovieDescView extends StatelessWidget {
  const MovieDescView({super.key});

  @override
  Widget build(BuildContext context) {
    var status = context.watch<MovieDetailCubit>().state.getMovieDetailsStatus
        as GetMovieDetailsSuccess;

    return Column(
      children: [
        24.h,
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 22),
          child: Text(
            status.movieDetail.overview!,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
