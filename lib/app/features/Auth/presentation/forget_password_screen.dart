import 'package:e_commerce_app/app/core/config/theme/app_colors.dart';
import 'package:e_commerce_app/app/core/config/theme/text_styles.dart';
import 'package:e_commerce_app/app/core/constants/dimensions.dart';
import 'package:e_commerce_app/app/material/buttons/custom_button.dart';
import 'package:e_commerce_app/app/material/textfields/custom_text_field.dart';
import 'package:e_commerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../core/config/router/route_names.dart';
import '../../../material/images/app_svg_photo.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingMedium),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  AppLocalizations.of(context)!.forgetPassword,
                  style: TextStyles.semiBold28,
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 36.0),
                child: Text(
                  AppLocalizations.of(context)!.pleasewriteyouremail,
                  style: TextStyles.regular14.copyWith(
                    color: AppColors.secondaryText,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 64),
              AppSvgPhoto(path: Assets.iconsLock, width: 255, height: 160),
              SizedBox(height: 50),
              CustomTextField(
                labelText: AppLocalizations.of(context)!.emailAddress,
                hintText: AppLocalizations.of(context)!.enterYourEmail,
              ),
              SizedBox(height: 130),
              CustomButton(
                child: Text(AppLocalizations.of(context)!.next),
                onPressed: () {
                  Navigator.pushNamed(
                      context, RouteNames.newPassword);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
