import 'package:e_commerce_app/app/core/config/theme/app_colors.dart';
import 'package:e_commerce_app/app/core/config/theme/text_styles.dart';
import 'package:e_commerce_app/app/core/constants/dimensions.dart';
import 'package:e_commerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
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

class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLines;

  const ExpandableText({super.key, required this.text, this.trimLines = 3});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textSpan = TextSpan(
          text: widget.text,
          style: TextStyles.regular15,
        );

        final textPainter = TextPainter(
          text: textSpan,
          maxLines: widget.trimLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final isOverflow = textPainter.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              maxLines: expanded ? null : widget.trimLines,
              overflow: expanded ? TextOverflow.visible : TextOverflow.ellipsis,
              style: TextStyles.regular15.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
            if (isOverflow)
              GestureDetector(
                onTap: () {
                  setState(() => expanded = !expanded);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    expanded ? 'Read Less' : 'Read More..',
                    style: TextStyles.semiBold15.copyWith(
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
