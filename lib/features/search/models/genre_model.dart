import 'package:hive_flutter/hive_flutter.dart';

part 'genre_model.g.dart';

@HiveType(typeId: 1)
class GenreModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  GenreModel({
    required this.id,
    required this.name,
  });
}
