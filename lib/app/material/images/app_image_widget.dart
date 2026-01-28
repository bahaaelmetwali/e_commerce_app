import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppImageWidget extends StatelessWidget {
  const AppImageWidget({
    super.key,
    required this.path,
    this.height,
    this.width,
    this.fit,
    this.scale,
    this.canCache = true,
    this.placeholder,
    this.errorWidget,
  });

  final String path;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double? scale;

  final bool canCache;

  final Widget? placeholder;
  final Widget? errorWidget;

  bool get _isNetwork =>
      path.startsWith('http://') || path.startsWith('https://');

  bool get _isFile => path.startsWith('/');

  @override
  Widget build(BuildContext context) {
    if (_isNetwork) {
      return _buildNetworkImage();
    }

    if (_isFile) {
      return Image.file(
        File(path),
        height: height,
        width: width,
        fit: fit,
        scale: scale ?? 1,
      );
    }

    if (path == "") {
      return errorWidget ?? const Icon(Icons.broken_image);
    }
    return Image.asset(
      path,
      height: height,
      width: width,
      fit: fit,
      scale: scale,
    );
  }

  Widget _buildNetworkImage() {
    if (!canCache) {
      return Image.network(
        path,
        height: height,
        width: width,
        fit: fit,
        scale: scale ?? 1,
      );
    }

    return CachedNetworkImage(
      imageUrl: path,
      height: height,
      width: width,
      fit: fit,
      placeholder: (_, __) =>
          placeholder ?? const Center(child: CircularProgressIndicator()),
      errorWidget: (_, __, ___) =>
          errorWidget ?? const Icon(Icons.broken_image),
    );
  }
}
