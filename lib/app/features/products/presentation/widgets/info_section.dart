
import 'package:flutter/material.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/text_styles.dart';
import '../../domain/entities/product_entity.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(productEntity.name, style: TextStyles.semiBold22),
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              AppLocalizations.of(context)!.price,
              style: TextStyles.regular16.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
            Text("\$${productEntity.price}", style: TextStyles.semiBold22),
          ],
        ),
      ],
    );
  }
}
