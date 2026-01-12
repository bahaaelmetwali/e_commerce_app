import 'package:e_commerce_app/app/core/config/theme/app_colors.dart';
import 'package:e_commerce_app/app/core/constants/dimensions.dart';
import 'package:e_commerce_app/app/features/home/presentation/widgets/list_of_products.dart'
    show ListofProducts;

import 'package:e_commerce_app/l10n/app_localizations.dart';

import 'package:flutter/material.dart';

import '../../../core/config/router/route_names.dart';
import '../../../core/config/theme/text_styles.dart';
import 'widgets/custom_slider.dart';
import 'widgets/home_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingMedium,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 18),
                HomeAppBar(),
                SizedBox(height: 30),
                CustomSlider(),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.newArraivalProducts,
                      style: TextStyles.medium18,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.allProducts);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.viewAll,
                        style: TextStyles.regular14.copyWith(
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                ListofProducts(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
