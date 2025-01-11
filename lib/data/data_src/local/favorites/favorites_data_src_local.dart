import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:tmdb/core/services/image_storage/image_storage.dart';
import 'package:tmdb/features/search/models/movie_info_model.dart';

class FavoritesDataSrcLocal {
  static const String _boxName = 'favorites';
  Box<MovieInfoModel>? _movieBox;

  final Logger _logger;
  final ImageStorage _imageStorage;

  FavoritesDataSrcLocal(this._logger, this._imageStorage);

  Future<Box<MovieInfoModel>> _initBox() async {
    if (_movieBox == null || !_movieBox!.isOpen) {
      _movieBox = await Hive.openBox<MovieInfoModel>(_boxName);
    }
    return _movieBox!;
  }

  Future<MovieInfoModel> add(MovieInfoModel movie) async {
    final box = await _initBox();

    final localPosterPath = await _imageStorage.downloadAndSaveImage(
      movie.posterUrl ?? '',
      '${movie.id}.jpg',
    );

    final movieWithLocalPoster = MovieInfoModel(
      id: movie.id,
      title: movie.title,
      posterUrl: localPosterPath,
      voteAverage: movie.voteAverage,
      releaseDate: movie.releaseDate,
      genres: movie.genres,
    );

    if (!box.containsKey(movie.id)) {
      await box.put(movie.id, movieWithLocalPoster);
      _logger.i("Movie added to favorites: ${movie.title}");
    } else {
      _logger.w("Movie already in favorites: ${movie.title}");
    }
    return movieWithLocalPoster;
  }

  Future<MovieInfoModel?> remove(int movieId) async {
    final box = await _initBox();

    if (box.containsKey(movieId)) {
      final movie = box.get(movieId);

      if (movie?.posterUrl != null) {
        final file = File(movie!.posterUrl!);
        if (await file.exists()) {
          await file.delete();
        }
      }

      await box.delete(movieId);
      _logger.i("Movie removed from favorites: ${movie?.title}");
      return movie;
    } else {
      _logger.w("Movie not found in favorites with ID: $movieId");
      return null;
    }
  }

  Future<List<MovieInfoModel>> getAll() async {
    final box = await _initBox();
    final movies = box.values.toList();
    _logger.i("Fetched ${movies.length} favorite movies");
    return movies;
  }

  Future<bool> isFavorited(int movieId) async {
    final box = await _initBox();
    return box.containsKey(movieId);
  }
}
