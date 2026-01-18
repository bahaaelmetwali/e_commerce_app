import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:mega/app/features/onboarding/presentation/widgets/on_boarding_bottom_sheet.dart';
import 'package:mega/app/material/images/app_image_widget.dart';
import 'package:mega/constants/assets.dart';
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
              child: AppImageWidget(
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
