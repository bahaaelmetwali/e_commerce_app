
import 'package:flutter/material.dart';

import '../../../../../constants/assets.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../material/images/app_photo.dart';
import '../../../../material/images/app_svg_photo.dart';

class MainImageCard extends StatelessWidget {
  const MainImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 260,
          color: Color(0xffF2F2F2),
          child: AppPhoto(
            path: Assets.imagesCardtest,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        ),
        PositionedDirectional(
          top: 16,
          start: 16,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: AppColors.primaryText),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        PositionedDirectional(
          top: 16,
          end: 16,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: AppSvgPhoto(path: Assets.iconsAddToFav),
            ),
          ),
        ),
      ],
    );
  }
}