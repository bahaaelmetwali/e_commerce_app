import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/config/router/route_names.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/text_styles.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/localization/cubit/language_cubit.dart';
import '../../../../material/buttons/custom_button.dart';

class OnBoardingButtonSheet extends StatelessWidget {
  const OnBoardingButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingMedium),
        child: Column(
          spacing: 12,
          children: [
            Text(
              AppLocalizations.of(context)!.lookGoodFeelGood,
              style: TextStyles.semiBold25,
            ),
            Text(
              textAlign: TextAlign.center,
              AppLocalizations.of(context)!.createYourStyle,
              style: TextStyles.regular15.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
            SizedBox(height: 20),

            BlocBuilder<LanguageCubit, LanguageState>(
              builder: (context, state) {
                return CustomButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, RouteNames.login);
                  },
                  child: Text(AppLocalizations.of(context)!.getStarted),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
