import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

class ImageStorage {
  final Dio _dio;

  ImageStorage(this._dio);

  Future<String> downloadAndSaveImage(String imageUrl, String fileName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';

      await _dio.download(imageUrl, filePath);

      return filePath;
    } catch (e) {
      throw Exception("Failed to download and save image: $e");
    }
  }

  File loadImage(String filePath) {
    return File(filePath);
  }
}
