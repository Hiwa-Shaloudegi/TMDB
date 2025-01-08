import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tmdb/common/extensions/num_extension.dart';
import 'package:tmdb/common/widgets/dot_loading.dart';
import 'package:tmdb/common/widgets/no_result_widget.dart';
import 'package:tmdb/common/widgets/sliver_main_app_bar.dart';
import 'package:tmdb/common/widgets/sliver_movie_info_item_list.dart';
import 'package:tmdb/config/consts/app_sizes.dart';
import 'package:tmdb/common/widgets/search_field.dart';
import 'package:tmdb/features/search/cubit/search_cubit.dart';
import 'package:tmdb/features/search/cubit/search_status.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController searchTextController;

  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverMainAppBar(
            title: 'Search',
            trailing: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSizes.pagePadding),
              child: Transform.scale(
                scale: 1.2,
                child: SvgPicture.asset('assets/icons/info_circle.svg'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SearchField(controller: searchTextController),
          ),
          ...[
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                var searchStatus = state.searchMovieStatus;
                if (searchStatus is SearchMovieLoading) {
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: DotLoading(),
                    ),
                  );
                } else if (searchStatus is SearchMovieError) {
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: NoResultWidget(
                      imagePath: 'assets/images/no_results_search.svg',
                      title: 'Something Went Wrong!',
                      subTitle: 'Please check your connection',
                    ),
                  );
                } else if (searchStatus is SearchMovieSuccess) {
                  if (searchStatus.movieList.isEmpty) {
                    return const SliverFillRemaining(
                      hasScrollBody: false,
                      child: NoResultWidget(
                        imagePath: 'assets/images/no_results_search.svg',
                        title: 'We Are Sorry, We Can Not Find The Movie :(',
                        subTitle:
                            'Find your movie by Type title, categories, years, etc',
                      ),
                    );
                  } else {
                    return SliverMainAxisGroup(
                      slivers: [
                        48.sh,
                        SliverMovieInfoItemList(
                          movieList: searchStatus.movieList,
                        ),
                        16.sh,
                      ],
                    );
                  }
                }
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: NoResultWidget(
                    imagePath: 'assets/images/no_results_search.svg',
                    title: 'Search Movies Here',
                    subTitle: 'Search for the name of any movie',
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}
