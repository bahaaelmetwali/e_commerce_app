import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.onPressed,
  });
  final Widget child;
  final double? height;
  final double? width;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? double.infinity,
      child: ElevatedButton(onPressed: onPressed, child: child),
    );
  }
}
