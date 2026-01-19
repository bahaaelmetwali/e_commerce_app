import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/core/config/theme/text_styles.dart';
import 'package:mega/app/core/constants/dimensions.dart';
import 'package:mega/app/core/di/injection.dart';
import 'package:mega/app/core/utils/validator.dart';
import 'package:mega/app/features/Auth/domain/use_cases/login_use_case.dart';
import 'package:mega/app/material/buttons/custom_button.dart';
import 'package:mega/app/material/textfields/custom_text_field.dart';
import 'package:mega/l10n/app_localizations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/config/router/route_names.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../material/snakbars/show_custom_snack_bar.dart';
import 'cubits/login/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),

      child: Form(
        key: _formKey,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingMedium),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: 80),
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
                    validator: Validator.emailValidator,
                    controller: emailController,
                  ),
                  SizedBox(height: 28),
                  CustomTextField(
                    labelText: AppLocalizations.of(context)!.password,
                    validator: Validator.passwordValidator,
                    controller: passwordController,
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.alreadyHaveAccount,
                          style: TextStyles.regular15.copyWith(
                            color: AppColors.secondaryText,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RouteNames.register);
                          },
                          child: Text(
                            ' ${AppLocalizations.of(context)!.signUp}',
                            style: TextStyles.semiBold15.copyWith(
                              color: AppColors.primaryText,
                            ),
                          ),
                        ),
                      ],
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
                          text:
                              ' ${AppLocalizations.of(context)!.continueAsGuest}',
                          style: TextStyles.semiBold15.copyWith(
                            color: AppColors.primaryText,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                context,
                                RouteNames.mainLayout,
                                arguments: true,
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80),
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        showCustomSnackBar(
                          context,
                          message: AppLocalizations.of(
                            context,
                          )!.loginSuccessful,
                        );
                        Navigator.pushReplacementNamed(
                          context,
                          RouteNames.mainLayout,
                          arguments: false,
                        );
                      } else if (state is LoginFailure) {
                        showCustomSnackBar(
                          context,
                          message: state.errorMessage,
                          isError: true,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return CustomButton(
                          onPressed: () {},
                          child: AppLocalizations.of(context)!.login,
                          isLoading: true,
                        );
                      } else {
                        return CustomButton(
                          child: AppLocalizations.of(context)!.login,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final loginRequest = LoginParams(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                fcmToken: '',
                              );
                              context.read<LoginCubit>().login(params: loginRequest);
                            }
                          },
                        );
                      }
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
