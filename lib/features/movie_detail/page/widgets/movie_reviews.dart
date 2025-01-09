import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/common/extensions/num_extension.dart';
import 'package:tmdb/common/widgets/dot_loading.dart';
import 'package:tmdb/common/widgets/retry_error_widget.dart';
import 'package:tmdb/config/consts/app_sizes.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';
import 'package:tmdb/features/movie_detail/cubit/movie_detail_cubit.dart';

class MovieReviews extends StatefulWidget {
  const MovieReviews({super.key, required this.movieId});

  final String movieId;

  @override
  State<MovieReviews> createState() => _MovieReviewsState();
}

class _MovieReviewsState extends State<MovieReviews> {
  @override
  void initState() {
    if (context.read<MovieDetailCubit>().state.getMovieReviewsStatus
        is! GetMovieReviewsSuccess) {
      context.read<MovieDetailCubit>().getMovieReviews(id: widget.movieId);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      builder: (context, state) {
        final reviewsStatus = state.getMovieReviewsStatus;

        if (reviewsStatus is GetMovieReviewsLoading) {
          return const Center(
            child: DotLoading(size: 20),
          );
        } else if (reviewsStatus is GetMovieReviewsError) {
          return RetryErrorWidget(onRetry: () {
            context
                .read<MovieDetailCubit>()
                .getMovieReviews(id: widget.movieId);
          });
        } else if (reviewsStatus is GetMovieReviewsSuccess) {
          return reviewsStatus.reviewes.isEmpty
              ? Center(
                  child: Text(
                    "No reviews for this movie :(",
                    style: textTheme.titleLarge,
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: reviewsStatus.reviewes.length,
                        separatorBuilder: (context, index) => 40.h,
                        itemBuilder: (context, index) {
                          var review = reviewsStatus.reviewes[index];

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.pagePadding),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: (review.avatarUrl == null) ||
                                              (review.avatarUrl!.isEmpty)
                                          ? Image.asset(
                                              'assets/images/person.png')
                                          : CachedNetworkImage(
                                              imageUrl: review.avatarUrl!,
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              errorWidget: (context, url,
                                                      error) =>
                                                  Image.asset(
                                                      'assets/images/person.png'),
                                            ),
                                    ),
                                    16.h,
                                    Text(
                                      review.rating == null
                                          ? ''
                                          : review.rating.toString(),
                                      style: const TextStyle(
                                          color: AppColors.secondary),
                                    ),
                                  ],
                                ),
                                16.w,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        review.authorName,
                                        style: textTheme.titleLarge!
                                            .copyWith(fontSize: 15),
                                      ),
                                      16.h,
                                      Text(
                                        review.content,
                                        style: textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    16.h,
                  ],
                );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
