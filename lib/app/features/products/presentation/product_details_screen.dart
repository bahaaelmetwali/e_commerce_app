import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:mega/app/core/config/theme/text_styles.dart';
import 'package:mega/app/core/constants/dimensions.dart';
import 'package:mega/app/core/di/injection.dart';
import 'package:mega/app/features/products/presentation/cubits/get_product/get_product_cubit.dart';
import 'package:mega/app/features/products/presentation/widgets/info_section.dart';
import 'package:mega/app/features/products/presentation/widgets/reviews_section.dart';
import 'package:mega/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../domain/use_cases/get_product_use_case.dart';
import 'widgets/expandable_text.dart';
import 'widgets/main_image_card.dart';
import 'widgets/preview_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<GetProductCubit>()
            ..getProduct(GetProductParams(productId: productId)),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<GetProductCubit, GetProductState>(
            builder: (context, state) {
              if (state is GetProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }

              if (state is GetProductFailure) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(Dimensions.paddingMedium),
                    child: Text(
                      state.failure.message,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }

              if (state is GetProductSuccess) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainImageCard(product: state.product),
                      Padding(
                        padding: const EdgeInsets.all(Dimensions.paddingMedium),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InfoSection(productEntity: state.product),
                            const SizedBox(height: Dimensions.paddingMedium),
                            if (state.product.images.isNotEmpty)
                              PreviewWidget(product: state.product),
                            const SizedBox(height: Dimensions.paddingMedium),
                            Text(
                              AppLocalizations.of(context)!.description,
                              style: TextStyles.semiBold18,
                            ),
                            ExpandableText(text: state.product.description),
                            const SizedBox(height: Dimensions.paddingMedium),
                            const ReviewsSection(),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
