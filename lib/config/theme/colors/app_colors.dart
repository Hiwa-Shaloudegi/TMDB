import 'package:flutter/material.dart';

abstract class AppColors {
  /// App Basic Colors
  static const primary = Color(0xFF0D243E);
  static const secondary = Color(0xFF01B4E4);
  static const accent = Color(0xFF21201E);

  /// Text Colors
  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFF92929D);

  /// Background Colors
  static const backgroundLight = Color(0xFFFBFAFA);
  static const backgroundDark = Color(0xFF0D243E);

  /// TextField Colors
  static const textFieldBgLight = Color(0xFFFBFAFA);
  static const textFieldBgDark = Color(0xFF3A3F47);

  /// Shimmer Loading Colors
  static final shimmerBaseLight = Colors.grey.shade300;
  static final shimmerBaseDark = Colors.grey.shade700;
  static final shimmerHighlightDark = Colors.grey.shade500;

  /// Unselected Label
  static const unselectedLabelLight = Color(0xFF67686D);
  static final containerBannerSurface =
      const Color(0xFF252836).withOpacity(0.32);
}
