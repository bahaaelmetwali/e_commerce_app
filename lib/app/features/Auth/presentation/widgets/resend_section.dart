import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/text_styles.dart';

class ResendSection extends StatefulWidget {
  const ResendSection({super.key});

  @override
  State<ResendSection> createState() => _ResendSectionState();
}

class _ResendSectionState extends State<ResendSection> {
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
              child: GestureDetector(
                onTap: () {
                  resendDelay();
                },
                child: Text(
                  ' ${AppLocalizations.of(context)!.resend}',
                  style: TextStyles.medium13.copyWith(
                    color: AppColors.primaryText,
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
