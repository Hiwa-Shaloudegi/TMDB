import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tmdb/common/extensions/num_extension.dart';
import 'package:tmdb/common/widgets/no_result_widget.dart';
import 'package:tmdb/common/widgets/sliver_main_app_bar.dart';
import 'package:tmdb/common/widgets/sliver_movie_info_item_list.dart';
import 'package:tmdb/config/consts/app_sizes.dart';
import 'package:tmdb/common/widgets/search_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController searchTextController;
  List searchedMovieList = [];

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
          if (searchedMovieList.isEmpty)
            const NoResultWidget(
              imagePath: 'assets/images/no_results_search.svg',
              title: 'We Are Sorry, We Can Not Find The Movie :(',
              subTitle: 'Find your movie by Type title, categories, years, etc',
            )
          else ...[
            48.sh,
            const SliverMovieInfoItemList(),
            16.sh,
          ]
        ],
      ),
    );
  }
}
