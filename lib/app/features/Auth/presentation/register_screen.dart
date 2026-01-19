import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/core/di/injection.dart';
import 'package:mega/app/core/utils/validator.dart';
import 'package:mega/app/features/Auth/domain/use_cases/register_use_case.dart';
import 'package:mega/app/material/snakbars/show_custom_snack_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../core/config/router/route_names.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/config/theme/text_styles.dart';
import '../../../core/constants/dimensions.dart';
import '../../../material/buttons/custom_button.dart';
import '../../../material/textfields/custom_text_field.dart';
import 'cubits/register/register_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showPassword = true;
  bool showConfirmPassword = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext _) {
    return BlocProvider(
      create: (_) => getIt<RegisterCubit>(),
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                    controller: nameController,
                    hintText: AppLocalizations.of(context)!.enterYourName,
                    validator: Validator.nameValidator,
                  ),
                  SizedBox(height: 28),
                  CustomTextField(
                    labelText: AppLocalizations.of(context)!.emailAddress,
                    controller: emailController,
                    hintText: AppLocalizations.of(context)!.enterYourEmail,
                    validator: Validator.emailValidator,
                  ),
                  SizedBox(height: 28),
                  CustomTextField(
                    labelText: AppLocalizations.of(context)!.password,
                    controller: passwordController,
                    obscureText: showPassword,
                    hintText: AppLocalizations.of(context)!.enterYourPassword,
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
                  SizedBox(height: 28),
                  CustomTextField(
                    labelText: AppLocalizations.of(context)!.confirmPassword,
                    hintText: AppLocalizations.of(context)!.confirmYourPassword,
                    controller: confirmPasswordController,
                    validator: (value) => Validator.confirmPasswordValidator(
                      value,
                      password: passwordController.text,
                    ),

                    obscureText: showConfirmPassword,
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

                  SizedBox(height: 86),
                  BlocConsumer<RegisterCubit, RegisterCubitState>(
                    listener: (context, state) {
                      if (state is RegisterCubitSuccess) {
                        showCustomSnackBar(
                          context,
                          message: AppLocalizations.of(
                            context,
                          )!.registrationSuccessful,
                        );
                        Navigator.pushNamed(
                          context,
                          RouteNames.verificationCode,
                        );
                      } else if (state is RegisterCubitFailure) {
                        showCustomSnackBar(
                          context,
                          message: state.errorMessage,
                          isError: true,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is RegisterCubitLoading) {
                        return CustomButton(
                          onPressed: () {},
                          child: AppLocalizations.of(context)!.register,
                          isLoading: true,
                        );
                      }
                      return CustomButton(
                        child: AppLocalizations.of(context)!.register,
                        onPressed: () {
                          final registerRequest = RegisterParams(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          if (_formKey.currentState!.validate()) {
                            context.read<RegisterCubit>().register(
                              registerRequest,
                            );
                          }
                        },
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
