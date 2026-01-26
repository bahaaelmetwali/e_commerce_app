
import 'package:flutter/material.dart';

import '../../../../../constants/assets.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/text_styles.dart';
import '../../../../material/images/app_image_widget.dart';

class EmptyNotifications extends StatelessWidget {
  const EmptyNotifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: AppImageWidget(
            path: Assets.imagesNotificationBackGround,
            height: 201,
            width: double.infinity,
          ),
        ),
        SizedBox(height: 24),
        Text(
          AppLocalizations.of(context)!.silenceIsGoldenButDealsAreBetter,
          style: TextStyles.bold18,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          AppLocalizations.of(context)!.silenceIsGoldenButDealsAreBetter,
          style: TextStyles.regular14,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 160,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.greyBackGround,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.exploreProducts,
                style: TextStyles.bold14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
