class MovieDetail {
  final int id;
  final String? title;
  final String? overview;
  final String? backdropPath;
  final String? posterPath;
  final List<Gener>? geners;
  final int runtime;
  final double voteAverage;

  MovieDetail({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.geners,
    required this.runtime,
    required this.voteAverage,
  });
}

class Gener {
  final int id;
  final String name;

  Gener({required this.id, required this.name});
}
