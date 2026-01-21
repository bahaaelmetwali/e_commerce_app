import 'package:flutter/material.dart';

import '../../../../../constants/assets.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../core/config/theme/app_colors.dart' show AppColors;
import '../../../../core/config/theme/text_styles.dart';
import '../../../../material/images/app_svg_photo.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            RichText(
              text: TextSpan(
                text: AppLocalizations.of(context)!.hello,
                style: TextStyles.semiBold28.copyWith(
                  color: AppColors.primaryText,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'User',
                    style: TextStyles.semiBold28.copyWith(
                      color: AppColors.nameText,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 4),
            Text(
              AppLocalizations.of(context)!.welcomeToMega,
              style: TextStyles.medium14.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.greyBackGround,
          child: Center(child: AppSvgIcon(path: Assets.iconsNotification)),
        ),
      ],
    );
  }
}
