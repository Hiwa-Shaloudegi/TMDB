import 'package:flutter/material.dart';
import 'package:tmdb/common/extensions/num_extension.dart';
import 'package:tmdb/common/widgets/no_result_widget.dart';
import 'package:tmdb/common/widgets/sliver_main_app_bar.dart';
import 'package:tmdb/common/widgets/sliver_movie_info_item_list.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<StatefulWidget> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List favMovieList = [0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverMainAppBar(title: 'Favorites'),
          if (favMovieList.isEmpty)
            const NoResultWidget(
              imagePath: 'assets/images/magic_box.svg',
              title: 'There Is No Movie Yet!',
              subTitle: 'Find your movie by Type title, categories, years, etc',
            )
          else ...[
            24.sh,
            const SliverMovieInfoItemList(),
            16.sh,
          ],
        ],
      ),
    );
  }
}
