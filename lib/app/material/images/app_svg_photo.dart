import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvgIcon extends StatelessWidget {
  const AppSvgIcon({
    super.key,
    required this.path,
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.contain,
    this.placeholder,
    this.constraints,
  });
  final String path;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit fit;
  final BoxConstraints? constraints;

  final Widget? placeholder;

  bool get _isNetwork =>
      path.startsWith('http://') || path.startsWith('https://');

  bool get _isFile => path.startsWith('/');

  ColorFilter? get _colorFilter =>
      color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null;
  @override
  Widget build(BuildContext context) {
    Widget svg;

    if (_isNetwork) {
      svg = SvgPicture.network(
        path,
        height: height,
        width: width,
        fit: fit,
        colorFilter: _colorFilter,
        placeholderBuilder: (_) => placeholder ?? const SizedBox.shrink(),
      );
    } else if (_isFile) {
      svg = SvgPicture.file(
        File(path),
        height: height,
        width: width,
        fit: fit,
        colorFilter: _colorFilter,
      );
    } else {
      svg = SvgPicture.asset(
        path,
        height: height,
        width: width,

        fit: fit,
        colorFilter: _colorFilter,
      );
    }

    if (constraints != null) {
      return ConstrainedBox(constraints: constraints!, child: svg);
    }

    return svg;
  }
}
