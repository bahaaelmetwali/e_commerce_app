import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/assets.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../core/config/router/route_names.dart';
import '../../../core/config/theme/text_styles.dart';
import '../../../material/buttons/custom_button.dart';
import '../../../material/images/app_svg_photo.dart';
import '../../../material/snakbars/show_custom_snack_bar.dart';
import '../../Auth/domain/use_cases/verify_email_use_case.dart';
import '../../Auth/presentation/cubits/verify_email/verify_email_cubit.dart';
import '../../Auth/presentation/cubits/verify_email_update/verify_email_updated_cubit.dart';
import 'widgets/resend_verification_email_update.dart';
import 'widgets/verify_email_updated_otp.dart';

class VerifyEmailUpdateScreen extends StatefulWidget {
  const VerifyEmailUpdateScreen({super.key});

  @override
  State<VerifyEmailUpdateScreen> createState() =>
      _VerifyEmailUpdateScreenState();
}

class _VerifyEmailUpdateScreenState extends State<VerifyEmailUpdateScreen> {
  final TextEditingController pinController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                AppLocalizations.of(context)!.verificationCode,
                style: TextStyles.semiBold28,
              ),
            ),
            SizedBox(height: 68),
            AppSvgIcon(path: Assets.iconsLock, width: 255, height: 160),
            SizedBox(height: 40),
            VerifyEmailUpdatedOtp(pinController: pinController),
            const SizedBox(height: 20),
            ResendVerificationEmailUpdatedSection(),
          ],
        ),
      ),
      bottomNavigationBar:
          BlocConsumer<VerifyEmailUpdatedCubit, VerifyEmailUpdatedState>(
            listener: (context, state) {
              if (state is VerifyEmailUpdatedSuccess) {
                showCustomSnackBar(
                  context,
                  message: AppLocalizations.of(context)!.otpVerificationIsTrue,
                );
                Navigator.pushReplacementNamed(
                  context,
                  RouteNames.mainLayout,
                  arguments: true,
                );
              } else if (state is VerifyEmailUpdatedFailure) {
                showCustomSnackBar(
                  context,
                  message: state.failure.toString(),
                  isError: true,
                );
              }
            },
            builder: (context, state) {
              return CustomButton(
                child: AppLocalizations.of(context)!.verify,
                isLoading: state is VerifyEmailLoading,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final otpRequest = VerifyEmailOtpRequestParams(
                      otp: pinController.text,
                    );
                    context.read<VerifyEmailUpdatedCubit>().verifyEmail(
                      params: otpRequest,
                    );
                  }
                },
              );
            },
          ),
    );
  }
}
