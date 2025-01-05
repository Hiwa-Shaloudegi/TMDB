import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb/app.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.primary,
    ),
  );
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
