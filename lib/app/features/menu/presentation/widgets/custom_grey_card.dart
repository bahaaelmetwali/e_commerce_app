
import 'package:flutter/widgets.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/text_styles.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../material/images/app_svg_photo.dart';

class CustomGreyCard extends StatelessWidget {
  const CustomGreyCard({super.key, required this.title, required this.icon});
  final String title;
  final String icon;
  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.greyBackGroundCard,
        borderRadius: BorderRadius.all(
          Radius.circular(Dimensions.paddingSmall),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSmall),
        child: Row(
          children: [
            AppSvgIcon(path: icon, height: 24, width: 24),
            const SizedBox(width: 20),
            Text(title, style: TextStyles.semiBold15),
            Spacer(),

            Icon(
              isRtl ? Iconsax.arrow_circle_left : Iconsax.arrow_circle_right,
            ),
          ],
        ),
      ),
    );
  }
}
