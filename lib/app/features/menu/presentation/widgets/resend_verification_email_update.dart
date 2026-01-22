

import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/text_styles.dart';
import '../../../../material/snakbars/show_custom_snack_bar.dart';
import '../../../Auth/presentation/cubits/resend_email_updated/resend_email_updated_cubit.dart';

class ResendVerificationEmailUpdatedSection extends StatefulWidget {
  const ResendVerificationEmailUpdatedSection({super.key});

  @override
  State<ResendVerificationEmailUpdatedSection> createState() =>
      _ResendVerificationEmailUpdatedSectionState();
}

class _ResendVerificationEmailUpdatedSectionState
    extends State<ResendVerificationEmailUpdatedSection> {
  late Timer timer;
  int remainingSeconds = 60;
  @override
  void initState() {
    resendDelay();
    super.initState();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void resendDelay() {
    remainingSeconds = 60;
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyles.regular14.copyWith(color: AppColors.secondaryText),
        children: [
          TextSpan(
            text: AppLocalizations.of(context)!.dontreciveconfirmationcode,
          ),
          if (remainingSeconds == 0)
            WidgetSpan(
              child:
                  BlocListener<
                    ResendEmailUpdatedCubit,
                    ResendEmailUpdatedState
                  >(
                    listener: (context, state) {
                      if (state is ResendEmailUpdatedSuccess) {
                        showCustomSnackBar(
                          context,
                          message: AppLocalizations.of(
                            context,
                          )!.resendOtpSuccessful,
                        );

                        resendDelay();
                      } else if (state is ResendEmailUpdatedFailure) {
                        showCustomSnackBar(
                          context,
                          message: state.failure.message,
                        );
                      }
                    },
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<ResendEmailUpdatedCubit>()
                            .resendEmailUpdated();
                      },
                      child: Text(
                        ' ${AppLocalizations.of(context)!.resend}',
                        style: TextStyles.medium13.copyWith(
                          color: AppColors.primaryText,
                        ),
                      ),
                    ),
                  ),
            )
          else if (remainingSeconds < 10)
            TextSpan(
              text: ' 00:0$remainingSeconds',
              style: TextStyles.medium13.copyWith(color: AppColors.primaryText),
            )
          else
            TextSpan(
              text: ' 00:$remainingSeconds',
              style: TextStyles.medium13.copyWith(color: AppColors.primaryText),
            ),
        ],
      ),
    );
  }
}
