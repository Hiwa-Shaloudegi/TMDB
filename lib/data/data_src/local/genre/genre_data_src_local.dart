import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:tmdb/features/search/models/genre_model.dart';

class GenreDataSrcLocal {
  static const String _boxName = 'movie_genre';
  Box? _movieGenreBox;

  final Logger _logger;

  GenreDataSrcLocal(this._logger);

  Future<Box> _initBox() async {
    if (_movieGenreBox == null || !_movieGenreBox!.isOpen) {
      _movieGenreBox = await Hive.openBox(_boxName);
    }
    return _movieGenreBox!;
  }

  Future<void> saveGenre(GenreModel genre) async {
    try {
      final box = await _initBox();
      await box.put(genre.id, genre.name);
    } catch (e) {
      _logger.e('Error saving genre: $e');
    }
  }

  Future<GenreModel?> getGenre(int id) async {
    try {
      final box = await _initBox();
      final genreName = box.get(id);
      if (genreName != null) {
        return GenreModel(id: id, name: genreName);
      }
    } catch (e) {
      _logger.e('Error retrieving genre: $e');
    }
    return null;
  }

  Future<void> saveGenreList(List<GenreModel> genreList) async {
    try {
      final box = await _initBox();
      final Map<int, String> genreMap = {
        for (var genre in genreList) genre.id: genre.name
      };
      await box.putAll(genreMap);
    } catch (e) {
      _logger.e('Error saving genre list: $e');
    }
  }

  Future<List<GenreModel>> getAllGenres() async {
    try {
      final box = await _initBox();
      return box.keys
          .map((key) => GenreModel(id: key as int, name: box.get(key)))
          .toList();
    } catch (e) {
      _logger.e('Error retrieving all genres: $e');
    }
    return [];
  }
}
