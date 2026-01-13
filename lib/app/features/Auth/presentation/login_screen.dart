import 'package:mega/app/core/config/theme/text_styles.dart';
import 'package:mega/app/core/constants/dimensions.dart';
import 'package:mega/app/material/buttons/custom_button.dart';
import 'package:mega/app/material/textfields/custom_text_field.dart';
import 'package:mega/l10n/app_localizations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/config/router/route_names.dart';
import '../../../core/config/theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(height: 24),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.login,
                  style: TextStyles.semiBold28,
                ),
              ),
              SizedBox(height: 30),
              CustomTextField(
                labelText: AppLocalizations.of(context)!.emailAddress,
                hintText: AppLocalizations.of(context)!.enterYourEmail,
              ),
              SizedBox(height: 28),
              CustomTextField(
                labelText: AppLocalizations.of(context)!.password,

                hintText: AppLocalizations.of(context)!.enterYourPassword,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.secondaryText,
                  ),
                ),
                obscureText: showPassword,
              ),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.forgetPassword);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.forgetPassword,
                    style: TextStyles.regular16.copyWith(
                      color: AppColors.errorColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 64),
              Divider(height: 3, color: AppColors.borderColor),
              SizedBox(height: 20),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: AppLocalizations.of(context)!.alreadyHaveAccount,
                        style: TextStyles.regular15.copyWith(
                          color: AppColors.secondaryText,
                        ),
                      ),
                      TextSpan(
                        text: ' ${AppLocalizations.of(context)!.signUp}',
                        style: TextStyles.semiBold15.copyWith(
                          color: AppColors.primaryText,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, RouteNames.register);
                          },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Divider(height: 3, color: AppColors.borderColor),
              SizedBox(height: 20),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: AppLocalizations.of(context)!.explore,
                      style: TextStyles.regular15.copyWith(
                        color: AppColors.secondaryText,
                      ),
                    ),
                    TextSpan(
                      text: ' ${AppLocalizations.of(context)!.continueAsGuest}',
                      style: TextStyles.semiBold15.copyWith(
                        color: AppColors.primaryText,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, RouteNames.mainLayOut);
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              CustomButton(
                child: Text(AppLocalizations.of(context)!.login),
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.mainLayOut);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
