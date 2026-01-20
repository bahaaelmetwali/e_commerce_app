import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/core/constants/dimensions.dart';
import 'package:mega/app/core/di/injection.dart';
import 'package:mega/app/features/Auth/presentation/cubits/update_password/update_password_cubit.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/config/theme/text_styles.dart';
import '../../../core/utils/validator.dart';
import '../../../material/buttons/custom_button.dart';
import '../../../material/snakbars/show_custom_snack_bar.dart';
import '../../../material/textfields/custom_text_field.dart';
import '../../Auth/domain/use_cases/change_password_use_case.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  bool showOldPassword = true;
  bool showPassword = true;
  bool showConfirmPassword = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UpdatePasswordCubit>(),
      child: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.updatePassword,
              style: TextStyles.semiBold17,
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: SizedBox(
            width: double.infinity,
            height: 60,
            child: BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
              listener: (context, state) {
                if (state is UpdatePasswordSuccess) {
                  showCustomSnackBar(
                    context,
                    message: AppLocalizations.of(
                      context,
                    )!.passwordChangedSucessfully,
                  );
                  Navigator.pop(context);
                } else if (state is UpdatePasswordFailure) {
                  showCustomSnackBar(
                    context,
                    message: state.failure.toString(),
                    isError: true,
                  );
                }
              },
              builder: (context, state) {
                if (state is UpdatePasswordLoading) {
                  return CustomButton(
                    onPressed: () {},
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    isLoading: true,
                    child: AppLocalizations.of(context)!.save,
                  );
                }

                return CustomButton(
                  onPressed: () {
                    final params = ChangePasswordParams(
                      oldPassword: oldPasswordController.text,
                      newPassword: passwordController.text,
                      confirmPassword: confirmPasswordController.text,
                    );
                    context.read<UpdatePasswordCubit>().updatePassword(params);
                  },
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: AppLocalizations.of(context)!.save,
                );
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingMedium),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                    labelText: AppLocalizations.of(context)!.oldPassword,
                    hintText: AppLocalizations.of(
                      context,
                    )!.enterYourOldPassword,
                    obscureText: showOldPassword,
                    controller: oldPasswordController,
                    validator: Validator.passwordValidator,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          showOldPassword = !showOldPassword;
                        });
                      },
                      child: Icon(
                        showOldPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    labelText: AppLocalizations.of(context)!.newPassword,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
