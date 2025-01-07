class MoviePoster {
  final int id;
  final String poster;

  MoviePoster({
    required this.id,
    required this.poster,
  });

  factory MoviePoster.fromJson(Map<String, dynamic> json) {
    return MoviePoster(
      id: json['id'],
      poster: json['poster_path'],
    );
  }
}
