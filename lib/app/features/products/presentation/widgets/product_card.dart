import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/features/favorites/presentation/cubits/favorite/favorite_cubit.dart';

import '../../../../../constants/assets.dart';
import '../../../../core/config/router/route_names.dart';
import '../../../../core/config/theme/text_styles.dart';
import '../../../../material/images/app_image_widget.dart';
import '../../../../material/images/app_svg_photo.dart';
import '../../domain/entities/product_entity.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteNames.productDetails,
          arguments: product.id,
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
                  path: product.image,
                  fit: BoxFit.cover,
                ),
                PositionedDirectional(
                  top: 8,
                  end: 8,
                  child: BlocBuilder<FavoriteCubit, FavoriteState>(
                    builder: (context, state) {
                      final isFavorite = state.favorites.any(
                        (p) => p.id == product.id,
                      );

                      return GestureDetector(
                        onTap: () {
                          context.read<FavoriteCubit>().toggleFavorite(product);
                        },
                        child: AppSvgIcon(
                          path: isFavorite
                              ? Assets.iconsFav
                              : Assets.iconsFavPage,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.name,
            style: TextStyles.medium12,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Text("\$${product.price}", style: TextStyles.semiBold14),
        ],
      ),
    );
  }
}
