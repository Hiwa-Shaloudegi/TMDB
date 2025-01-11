import 'package:hive_flutter/hive_flutter.dart';
import 'genre_model.dart';

part 'movie_info_model.g.dart';

@HiveType(typeId: 0)
class MovieInfoModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String? posterUrl;

  @HiveField(3)
  final double? voteAverage;

  @HiveField(4)
  final String releaseDate;

  @HiveField(5)
  final List<GenreModel>? genres;

  MovieInfoModel({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.voteAverage,
    required this.releaseDate,
    required this.genres,
  });
}
