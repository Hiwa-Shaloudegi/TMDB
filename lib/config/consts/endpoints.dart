abstract class Endpoints {
  static const tmdbBaseUrl = 'https://api.themoviedb.org/3/';
  static const tmdbImageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  // Trending
  static const trending = 'trending/movie/week';

  // Movies List
  static const nowPlaying = 'movie/now_playing';
  static const upcoming = 'movie/upcoming';
  static const topRated = 'movie/top_rated';
  static const popular = 'movie/popular';

  // Movies
  static const movieDetails = 'movie/{movie_id}';
  static const movieReviews = 'movie/{movie_id}/reviews';
  static const movieCast = 'movie/{movie_id}/credits';

  // Search
  static const searchMovie = 'search/movie';
}
