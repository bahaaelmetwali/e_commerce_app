import 'package:mega/app/core/config/theme/text_styles.dart';
import 'package:mega/app/core/constants/dimensions.dart';
import 'package:mega/app/features/Auth/presentation/widgets/otp_verification_section.dart';
import 'package:mega/app/material/images/app_svg_photo.dart';
import 'package:mega/constants/assets.dart';
import 'package:mega/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  AppLocalizations.of(context)!.verificationCode,
                  style: TextStyles.semiBold28,
                ),
              ),
              SizedBox(height: 68),
              AppSvgPhoto(path: Assets.iconsLock, width: 255, height: 160),
              SizedBox(height: 40),
              OtpVerificationSection(),
            ],
          ),
        ),
      ),
    );
  }
}
