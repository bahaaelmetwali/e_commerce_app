import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:mega/app/material/images/app_image_widget.dart';
import 'package:mega/app/material/images/app_svg_photo.dart';

import '../../../../../constants/assets.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../core/config/router/route_names.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/text_styles.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              AppLocalizations.of(context)!.reviews,
              style: TextStyles.semiBold18,
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.allReviews,
                  arguments: 'productId',
                );
              },
              child: Text(
                AppLocalizations.of(context)!.viewAll,
                style: TextStyles.medium15.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        child: ClipOval(
                          // child: state is GetCachedDataLoaded ?
                          child: AppImageWidget(
                            path:
                                // state.cachedData.avatar ??
                                Assets.imagesManTest,
                            canCache: true,
                            fit: BoxFit.cover,
                            width: 44,
                            height: 44,
                          ),
                          // : const Icon(Icons.person, size: 40),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Column(
                        children: [
                          Text('Ronald Richards', style: TextStyles.semiBold15),
                          Row(
                            spacing: 3,
                            children: [
                              AppSvgIcon(
                                path: Assets.iconsClock,
                                height: 16,
                                width: 16,
                              ),
                              Text(
                                '13 Sep, 2020',
                                style: TextStyles.medium12.copyWith(
                                  color: AppColors.secondaryText,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        spacing: 5,
                        children: [
                          Row(
                            spacing: 5,
                            children: [
                              Text('4.5', style: TextStyles.medium15),
                              Text(
                                'Rating',
                                style: TextStyles.medium12.copyWith(
                                  color: AppColors.secondaryText,
                                ),
                              ),
                            ],
                          ),
                          RatingBarIndicator(
                            rating: 4.5,
                            itemBuilder: (context, index) => Icon(
                              Icons.star_outlined,
                              color: AppColors.starColor,
                            ),
                            unratedColor: AppColors.secondaryText.withValues(
                              alpha: .5,
                            ),
                            itemCount: 5,
                            itemSize: 13.0,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Venenatis velit in massa auctor nam. '
                    'Quisque amet dui, quam ut sit.',
                    style: TextStyles.regular15.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
