import 'package:flutter/material.dart';

extension IntExtension on num {
  Widget get w => SizedBox(width: toDouble());

  Widget get h => SizedBox(height: toDouble());

  // inside slivers
  Widget get sw => SliverToBoxAdapter(child: SizedBox(width: toDouble()));

  Widget get sh => SliverToBoxAdapter(child: SizedBox(height: toDouble()));
}
