class MoviePoster {
  final String poster;

  MoviePoster({
    required this.poster,
  });

  factory MoviePoster.fromJson(Map<String, dynamic> json) {
    return MoviePoster(
      poster: json['poster_path'],
    );
  }
}
