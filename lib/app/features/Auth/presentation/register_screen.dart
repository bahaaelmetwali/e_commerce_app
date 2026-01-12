import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/config/theme/text_styles.dart';
import '../../../core/constants/dimensions.dart';
import '../../../material/buttons/custom_button.dart';
import '../../../material/textfields/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showPassword = true;
  bool showConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                  AppLocalizations.of(context)!.register,
                  style: TextStyles.semiBold28,
                ),
              ),
              SizedBox(height: 46),
              CustomTextField(
                labelText: AppLocalizations.of(context)!.name,
                hintText: AppLocalizations.of(context)!.enterYourName,
              ),
              SizedBox(height: 28),
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
              SizedBox(height: 28),
              CustomTextField(
                labelText: AppLocalizations.of(context)!.confirmPassword,
                hintText: AppLocalizations.of(context)!.confirmYourPassword,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      showConfirmPassword = !showConfirmPassword;
                    });
                  },
                  child: Icon(
                    showConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColors.secondaryText,
                  ),
                ),
                obscureText: showPassword,
              ),

              SizedBox(height: 86),
              CustomButton(child: Text('Register'), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
