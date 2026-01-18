import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/features/Auth/data/model/verify_pass_code_model.dart';
import 'package:mega/app/features/Auth/presentation/widgets/resend_section.dart';
import 'package:pinput/pinput.dart';

import '../../../../constants/assets.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../core/config/router/route_names.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/config/theme/text_styles.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/di/injection.dart';
import '../../../material/buttons/custom_button.dart';
import '../../../material/images/app_svg_photo.dart';
import '../../../material/snakbars/show_custom_snack_bar.dart';
import 'cubits/resend_code/resend_code_cubit.dart';
import 'cubits/verify_pass_code/verify_pass_code_cubit.dart';

class VerifyPasswordScreen extends StatelessWidget {
  const VerifyPasswordScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<VerifyPassCodeCubit>()),
        BlocProvider(create: (context) => getIt<ResendCodeCubit>()),
      ],
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingMedium),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                OtpVerifyPassWordSection(email: email),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OtpVerifyPassWordSection extends StatefulWidget {
  const OtpVerifyPassWordSection({super.key, required this.email});
  final String email;
  @override
  State<OtpVerifyPassWordSection> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<OtpVerifyPassWordSection> {
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

          BlocConsumer<VerifyPassCodeCubit, VerifyPassCodeState>(
            listener: (context, state) {
              if (state is VerifyPassCodeSuccess) {
                showCustomSnackBar(
                  context,
                  message: AppLocalizations.of(context)!.otpVerificationIsTrue,
                );
                Navigator.pushNamed(
                  context,
                  RouteNames.resetPassword,
                  arguments: {
                    'email': widget.email,
                    'otpCode': pinController.text,
                  },
                );
              } else if (state is VerifyPassCodeFailure) {
                showCustomSnackBar(
                  context,
                  message: state.errorMessage,
                  isError: true,
                );
              }
            },
            builder: (context, state) {
              if (state is VerifyPassCodeLoading) {
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
                    final verifyPassCodeModel = VerifyPassCodeModel(
                      code: pinController.text,
                      email: widget.email,
                    );
                    context.read<VerifyPassCodeCubit>().verifyPassCode(
                      verifyPassCodeModel: verifyPassCodeModel,
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
