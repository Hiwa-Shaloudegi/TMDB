import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/common/extensions/num_extension.dart';
import 'package:tmdb/common/widgets/dot_loading.dart';
import 'package:tmdb/common/widgets/no_result_widget.dart';
import 'package:tmdb/common/widgets/sliver_main_app_bar.dart';
import 'package:tmdb/common/widgets/sliver_movie_info_item_list.dart';
import 'package:tmdb/features/favorites/cubit/favorites_cubit.dart';
import 'package:tmdb/features/favorites/cubit/favorites_status.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<StatefulWidget> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    context.read<FavoritesCubit>().getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverMainAppBar(title: 'Favorites'),
          BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) {
              final getFavoritesStatus = state.getFavoritesStatus;

              if (getFavoritesStatus is GetFavoritesLoading) {
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: DotLoading(),
                  ),
                );
              } else if (getFavoritesStatus is GetFavoritesError) {
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: NoResultWidget(
                    imagePath: 'assets/images/no_results_search.svg',
                    title: 'Something Went Wrong!',
                    subTitle: 'Please check your connection',
                  ),
                );
              } else if (getFavoritesStatus is GetFavoritesSuccess) {
                if (getFavoritesStatus.favorites.isEmpty) {
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: NoResultWidget(
                      imagePath: 'assets/images/magic_box.svg',
                      title: 'There Is No Movie Yet!',
                      subTitle: 'First try adding a movie to your favorites',
                    ),
                  );
                } else {
                  return SliverMainAxisGroup(
                    slivers: [
                      48.sh,
                      SliverMovieInfoItemList(
                        movieList: getFavoritesStatus.favorites,
                      ),
                      16.sh,
                    ],
                  );
                }
              }
              return const SliverToBoxAdapter();
            },
          )
        ],
      ),
    );
  }
}
