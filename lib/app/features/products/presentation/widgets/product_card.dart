
import 'package:flutter/material.dart';

import '../../../../../constants/assets.dart';
import '../../../../core/config/router/route_names.dart';
import '../../../../core/config/theme/text_styles.dart';
import '../../../../material/images/app_image_widget.dart';
import '../../../../material/images/app_svg_photo.dart';
import '../../domain/entities/product_entity.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});
  final ProductEntity product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteNames.productDetails,
          arguments: widget.product.id,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                AppImageWidget(
                  height: 200,
                  width: double.infinity,
                  path: widget.product.image,
                  fit: BoxFit.cover,
                ),
                PositionedDirectional(
                  top: 8,
                  end: 8,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // favorites[index] = !favorites[index];
                      });
                    },
                    child: AppSvgIcon(
                      path: Assets.iconsFav,
                      // path: favorites[index]
                      // ? Assets.iconsFav
                      // : Assets.iconsFavPage,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.product.name,
            style: TextStyles.medium12,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Text("\$${widget.product.price}", style: TextStyles.semiBold14),
        ],
      ),
    );
  }
}
