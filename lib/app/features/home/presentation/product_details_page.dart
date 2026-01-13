import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:mega/app/core/config/theme/text_styles.dart';
import 'package:mega/app/core/constants/dimensions.dart';
import 'package:mega/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'widgets/expandable_text.dart';
import 'widgets/main_image_card.dart';
import 'widgets/preview_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MainImageCard(),
              Padding(
                padding: const EdgeInsets.all(Dimensions.paddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Nike Club Fleece", style: TextStyles.semiBold22),
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
                            Text("\$100.99", style: TextStyles.semiBold22),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: Dimensions.paddingMedium),

                    PreviewWidget(),
                    SizedBox(height: Dimensions.paddingMedium),
                    Text(
                      AppLocalizations.of(context)!.description,
                      style: TextStyles.semiBold18,
                    ),
                    ExpandableText(text: 'Hello' * 50),
                    SizedBox(height: Dimensions.paddingMedium),
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.reviews,
                          style: TextStyles.semiBold18,
                        ),
                        Spacer(),
                        Text(
                          AppLocalizations.of(context)!.viewAll,
                          style: TextStyles.medium15.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Text('Review $index');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
