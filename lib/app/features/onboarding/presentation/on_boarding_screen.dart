import 'package:e_commerce_app/app/core/config/theme/app_colors.dart';
import 'package:e_commerce_app/app/features/onboarding/presentation/widgets/on_boarding_bottom_sheet.dart';
import 'package:e_commerce_app/app/material/images/app_photo.dart';
import 'package:e_commerce_app/constants/assets.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: OnBoardingButtonSheet(),
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              child: AppPhoto(
                path: Assets.imagesManOnboarding,
                width: 375,
                height: 812,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
