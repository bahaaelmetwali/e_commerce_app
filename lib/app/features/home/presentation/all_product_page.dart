import 'package:e_commerce_app/app/core/constants/dimensions.dart';
import 'package:e_commerce_app/app/features/home/presentation/widgets/list_of_products.dart';
import 'package:e_commerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AllProductPage extends StatelessWidget {
  const AllProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.allProducts),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingMedium,
          ),
          child: ListofProducts(),
        ),
      ),
    );
  }
}
