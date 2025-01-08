import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DotLoading extends StatelessWidget {
  const DotLoading({
    super.key,
    this.size = 30,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: Colors.white,
      size: size,
    );
  }
}
