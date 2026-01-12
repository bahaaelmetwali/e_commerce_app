import 'package:e_commerce_app/app/core/config/theme/text_styles.dart';
import 'package:e_commerce_app/app/core/constants/dimensions.dart';
import 'package:e_commerce_app/app/material/buttons/custom_button.dart';
import 'package:e_commerce_app/app/material/textfields/custom_text_field.dart';
import 'package:e_commerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/router/route_names.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

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
                  AppLocalizations.of(context)!.newPassword,
                  style: TextStyles.semiBold28,
                ),
              ),
              SizedBox(height: 60),
              CustomTextField(
                labelText: AppLocalizations.of(context)!.password,
                hintText: AppLocalizations.of(context)!.enterYourNewPassword,
              ),
              SizedBox(height: 20),
              CustomTextField(
                labelText: AppLocalizations.of(context)!.confirmPassword,
                hintText: AppLocalizations.of(context)!.confirmYourPassword,
              ),
              SizedBox(height: 320),
              CustomButton(
                onPressed: () => {
                  Navigator.pushReplacementNamed(context, RouteNames.login),
                },
                child: Text(AppLocalizations.of(context)!.resetCode),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
