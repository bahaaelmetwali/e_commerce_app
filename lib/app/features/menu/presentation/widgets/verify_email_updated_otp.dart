import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/features/Auth/domain/use_cases/verify_email_use_case.dart';
import 'package:mega/app/features/Auth/presentation/cubits/verify_email/verify_email_cubit.dart';
import 'package:mega/app/features/Auth/presentation/cubits/verify_email_update/verify_email_updated_cubit.dart';
import 'package:mega/app/features/Auth/presentation/widgets/resend_section.dart';
import 'package:flutter/material.dart';
import 'package:mega/app/material/snakbars/show_custom_snack_bar.dart';
import 'package:pinput/pinput.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/config/router/route_names.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/text_styles.dart';
import '../../../../material/buttons/custom_button.dart';

class VerifyEmailUpdatedOtp extends StatefulWidget {
  const VerifyEmailUpdatedOtp({super.key});

  @override
  State<VerifyEmailUpdatedOtp> createState() => _VerifyEmailUpdatedOtpState();
}

class _VerifyEmailUpdatedOtpState extends State<VerifyEmailUpdatedOtp> {
  final TextEditingController pinController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = AppColors.primaryColor;
    const fillColor = Colors.transparent;
    const borderColor = AppColors.borderColor;

    final defaultPinTheme = PinTheme(
      width: 77,
      height: 90,
      textStyle: TextStyles.semiBold24.copyWith(color: AppColors.primaryText),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              controller: pinController,
              focusNode: focusNode,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 10),
              validator: (value) {
                return value!.length == 4
                    ? null
                    : AppLocalizations.of(context)!.pinisincorrect;
              },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
          SizedBox(height: 20),
          ResendSection(),

          SizedBox(height: 120),

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
              if (state is VerifyEmailLoading) {
                return CustomButton(
                  onPressed: () {},
                  child: AppLocalizations.of(context)!.verify,
                  isLoading: true,
                );
              }
              return CustomButton(
                child: AppLocalizations.of(context)!.verify,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final otpRequest = VerifyEmailOtpRequestParams(
                      otp: pinController.text,
                    );
                    context.read<VerifyEmailCubit>().verifyEmail(
                      params: otpRequest,
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
