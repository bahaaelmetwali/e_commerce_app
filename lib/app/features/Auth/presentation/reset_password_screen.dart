import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/core/config/theme/text_styles.dart';
import 'package:mega/app/core/constants/dimensions.dart';
import 'package:mega/app/core/di/injection.dart';
import 'package:mega/app/core/utils/validator.dart';
import 'package:mega/app/material/buttons/custom_button.dart';
import 'package:mega/app/material/textfields/custom_text_field.dart';
import 'package:mega/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../core/config/router/route_names.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../material/snakbars/show_custom_snack_bar.dart';
import '../domain/use_cases/reset_password_use_case.dart';
import 'cubits/reset_password/reset_password_cubit.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({
    super.key,

  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool showPassword = true;
  bool showConfirmPassword = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ResetPasswordCubit>(),
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                    hintText: AppLocalizations.of(
                      context,
                    )!.enterYourNewPassword,
                    obscureText: showPassword,
                    controller: passwordController,
                    validator: Validator.passwordValidator,
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
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    labelText: AppLocalizations.of(context)!.confirmPassword,
                    hintText: AppLocalizations.of(context)!.confirmYourPassword,
                    obscureText: showConfirmPassword,
                    controller: confirmPasswordController,
                    validator: (value) => Validator.confirmPasswordValidator(
                      value,
                      password: passwordController.text,
                    ),

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
                  ),
                  SizedBox(height: 320),
                  BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                    listener: (context, state) {
                      if (state is ResetPasswordSuccessState) {
                        showCustomSnackBar(
                          context,
                          message: AppLocalizations.of(
                            context,
                          )!.passwordChangedSucessfully,
                        );
                        Navigator.pushReplacementNamed(
                          context,
                          RouteNames.login,
                        );
                      } else if (state is ResetPasswordErrorState) {
                        showCustomSnackBar(
                          context,
                          message: state.message,
                          isError: true,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is ResetPasswordLoadingState) {
                        return CustomButton(
                          onPressed: () {},
                          child: AppLocalizations.of(context)!.resetCode,
                          isLoading: true,
                        );
                      }
                      return CustomButton(
                        onPressed: () => {
                          context.read<ResetPasswordCubit>().resetPassword(
                            ResetPasswordParams(
                              password: passwordController.text,
                              confirmPassword: confirmPasswordController.text,
                            ),
                          ),
                        },
                        child: AppLocalizations.of(context)!.resetCode,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
