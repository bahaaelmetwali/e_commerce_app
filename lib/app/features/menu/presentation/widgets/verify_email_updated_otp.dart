import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/text_styles.dart';

class VerifyEmailUpdatedOtp extends StatelessWidget {
  final TextEditingController pinController;

  const VerifyEmailUpdatedOtp({super.key, required this.pinController});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 77,
      height: 90,
      textStyle: TextStyles.semiBold24.copyWith(color: AppColors.primaryText),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: AppColors.borderColor),
      ),
    );

    return Pinput(
      controller: pinController,
      length: 4,
      defaultPinTheme: defaultPinTheme,
      validator: (value) =>
          value != null && value.length == 4 ? null : 'Invalid OTP',
    );
  }
}
