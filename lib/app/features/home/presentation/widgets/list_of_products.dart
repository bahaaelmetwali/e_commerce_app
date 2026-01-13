import 'package:mega/app/material/images/app_photo.dart';
import 'package:mega/app/material/images/app_svg_photo.dart';
import 'package:mega/constants/assets.dart';

import 'package:flutter/material.dart';

import '../../../../core/config/router/route_names.dart';
import '../../../../core/config/theme/text_styles.dart';

class ListofProducts extends StatefulWidget {
  const ListofProducts({super.key});

  @override
  State<ListofProducts> createState() => _ListofProductsState();
}

class _ListofProductsState extends State<ListofProducts> {
  final int itemCount = 8;
  late final List<bool> favorites;

  @override
  void initState() {
    super.initState();
    favorites = List.generate(itemCount, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 8,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: .57,
      ),

      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteNames.productDetails);
          },
          child: AspectRatio(
            aspectRatio: 5 / 6,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      AppPhoto(
                        path: Assets.imagesCardtest,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                      PositionedDirectional(
                        top: 8,
                        end: 8,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              favorites[index] = !favorites[index];
                            });
                          },
                          child: AppSvgPhoto(
                            path: favorites[index]
                                ? Assets.iconsFav
                                : Assets.iconsFavPage,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nike Sportswear Club Fleece",
                      textAlign: TextAlign.end,
                      style: TextStyles.medium12,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text("\$55.00", style: TextStyles.semiBold14),
              ],
            ),
          ),
        );
      },
    );
  }
}
