import 'package:flutter/material.dart';
import 'package:mega/app/core/config/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
  });
  final String child;
  final double? height;
  final double? width;
  final void Function()? onPressed;
  final bool isLoading;
  final bool isDisabled;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(child),
            SizedBox(width: 8),
            isLoading
                ? SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      color: AppColors.whiteColor,
                      strokeAlign: .05,
                      strokeWidth: 3,

                      backgroundColor: AppColors.greyBackGround.withValues(
                        alpha: .2,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
