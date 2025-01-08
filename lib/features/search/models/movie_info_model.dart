import 'package:tmdb/features/search/models/genre_model.dart';

class MovieInfoModel {
  final int id;
  final String title;
  final String? posterUrl;
  final double? voteAverage;
  final String releaseDate;
  final GenreModel? genre;

  MovieInfoModel({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.voteAverage,
    required this.releaseDate,
    required this.genre,
  });
}
