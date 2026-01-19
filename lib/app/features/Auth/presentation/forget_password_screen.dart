import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:mega/app/core/config/theme/text_styles.dart';
import 'package:mega/app/core/constants/dimensions.dart';
import 'package:mega/app/core/di/injection.dart';
import 'package:mega/app/material/buttons/custom_button.dart';
import 'package:mega/app/material/snakbars/show_custom_snack_bar.dart';
import 'package:mega/app/material/textfields/custom_text_field.dart';
import 'package:mega/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../core/config/router/route_names.dart';
import '../../../core/utils/validator.dart';
import '../../../material/images/app_svg_photo.dart';
import '../domain/use_cases/forget_password_use_case.dart';
import 'cubits/forget_password/forget_password_cubit.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgetPasswordCubit>(),
      child: Scaffold(
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
                AppSvgIcon(path: Assets.iconsLock, width: 255, height: 160),
                SizedBox(height: 50),
                CustomTextField(
                  labelText: AppLocalizations.of(context)!.emailAddress,
                  hintText: AppLocalizations.of(context)!.enterYourEmail,
                  controller: emailController,
                  validator: Validator.emailValidator,
                ),
                SizedBox(height: 130),
                BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                  listener: (context, state) {
                    if (state is ForgetPasswordSuccess) {
                      showCustomSnackBar(
                        context,
                        message: AppLocalizations.of(
                          context,
                        )!.vericationCodesentsuccessfully,
                      );
                      Navigator.pushNamed(
                        context,
                        RouteNames.verifyCodeForResetPassword,
                        arguments: emailController.text,
                      );
                    } else if (state is ForgetPasswordFailure) {
                      showCustomSnackBar(
                        context,
                        message: state.errorMessage,
                        isError: true,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is ForgetPasswordLoading) {
                      return CustomButton(
                        child: AppLocalizations.of(context)!.next,
                        onPressed: () {},
                        isLoading: true,
                      );
                    }
                    return CustomButton(
                      child: AppLocalizations.of(context)!.next,
                      onPressed: () {
                        context.read<ForgetPasswordCubit>().forgetPassword(
                          ForgetPasswordParams(email: emailController.text),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
