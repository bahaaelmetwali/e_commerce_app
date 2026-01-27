import 'package:flutter/material.dart';
import 'package:mega/app/features/products/domain/entities/product_entity.dart';

import '../../../../../constants/assets.dart';
import '../../../../core/config/router/route_names.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../material/images/app_image_widget.dart';
import '../../../../material/images/app_svg_photo.dart';

class MainImageCard extends StatelessWidget {
  const MainImageCard({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 260,
          color: Color(0xffF2F2F2),
          child: AppImageWidget(path: product.image, width: double.infinity),
        ),
        PositionedDirectional(
          top: 16,
          start: 16,
          child: CircleAvatar(
            radius: 20,
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
          bottom: 16,
          end: 16,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primaryColor,
            child: IconButton(
              icon: Icon(Icons.chat, color: AppColors.primaryText),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.chatScreen,
                  arguments: product.owner.id,
                );
              },
            ),
          ),
        ),
        PositionedDirectional(
          top: 16,
          end: 16,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: GestureDetector(
              onTap: () {},
              child: AppSvgIcon(path: Assets.iconsAddToFav),
            ),
          ),
        ),
      ],
    );
  }
}
