import 'package:flutter/widgets.dart';
import 'package:mega/app/core/config/theme/app_colors.dart';

import '../../../../core/config/theme/text_styles.dart';
import '../../../../material/images/app_svg_photo.dart';

class RowSection extends StatelessWidget {
  const RowSection({
    super.key,
    required this.title,
    required this.icon,
    this.color,
  });
  final String title;
  final String icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          AppSvgIcon(path: icon, height: 24, width: 24),
          const SizedBox(width: 10),
          Text(title, style: TextStyles.medium16.copyWith(color: color?? AppColors.primaryText) ),
        ],
      ),
    );
  }
}
