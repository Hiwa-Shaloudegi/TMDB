import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb/common/extensions/num_extension.dart';
import 'package:tmdb/common/widgets/dot_loading.dart';
import 'package:tmdb/common/widgets/retry_error_widget.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';
import 'package:tmdb/features/movie_detail/cubit/movie_detail_cubit.dart';

class MovieCastGridView extends StatefulWidget {
  const MovieCastGridView({super.key, required this.movieId});

  final String movieId;

  @override
  State<MovieCastGridView> createState() => _MovieCastGridViewState();
}

class _MovieCastGridViewState extends State<MovieCastGridView> {
  @override
  void initState() {
    if (context.read<MovieDetailCubit>().state.getMovieCastStatus
        is! GetMovieCastSuccess) {
      context.read<MovieDetailCubit>().getMovieCast(id: widget.movieId);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      builder: (context, state) {
        final castStatus = state.getMovieCastStatus;

        if (castStatus is GetMovieCastLoading) {
          return const Center(
            child: DotLoading(size: 20),
          );
        } else if (castStatus is GetMovieCastError) {
          return RetryErrorWidget(onRetry: () {
            context.read<MovieDetailCubit>().getMovieCast(id: widget.movieId);
          });
        } else if (castStatus is GetMovieCastSuccess) {
          return castStatus.casts.isEmpty
              ? Center(
                  child: Text(
                    "No cast for this movie :(",
                    style: textTheme.titleLarge,
                  ),
                )
              : Column(
                  children: [
                    24.h,
                    Expanded(
                      child: GridView.builder(
                        itemCount: castStatus.casts.length,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: size.height * 0.2,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          var cast = castStatus.casts[index];

                          return Column(
                            children: [
                              Container(
                                width: size.width * 0.25,
                                height: size.width * 0.25,
                                child: cast.profileUrl == null
                                    ? Image.asset('assets/images/person.png')
                                    : CachedNetworkImage(
                                        imageUrl: cast.profileUrl!,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.shimmerBaseDark,
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              alignment:
                                                  FractionalOffset.center,
                                              image: imageProvider,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Skeleton.ignore(
                                          child: Icon(Icons.error),
                                        ),
                                      ),
                              ),
                              16.h,
                              Text(
                                cast.name,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
