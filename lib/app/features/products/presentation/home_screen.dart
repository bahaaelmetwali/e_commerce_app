import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:mega/app/core/constants/dimensions.dart';
import 'package:mega/app/features/products/presentation/widgets/list_of_products.dart'
    show ListofProducts;

import 'package:mega/l10n/app_localizations.dart';

import 'package:flutter/material.dart';

import '../../../core/config/router/route_names.dart';
import '../../../core/config/theme/text_styles.dart';
import 'widgets/custom_slider.dart';
import 'widgets/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
