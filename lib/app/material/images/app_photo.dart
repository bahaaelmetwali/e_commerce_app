import 'package:flutter/material.dart';

class AppPhoto extends StatelessWidget {
  const AppPhoto({
    super.key,
    required this.path,
    this.height,
    this.width,
    this.fit,
    this.scale,
  });
  final String path;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double? scale;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      height: height,
      width: width,
      fit: fit,
      scale: scale,
    );
  }
}
