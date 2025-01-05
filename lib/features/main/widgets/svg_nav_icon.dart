import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';

class SvgNavIcon extends StatelessWidget {
  const SvgNavIcon(
    this.path, {
    super.key,
    required this.isSelected,
  });

  final bool isSelected;
  final String path;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      colorFilter: ColorFilter.mode(
        isSelected ? AppColors.secondary : AppColors.unselectedLabelLight,
        BlendMode.srcIn,
      ),
    );
  }
}
