import 'package:flutter/material.dart';
import 'package:mega/l10n/app_localizations.dart';

class AllReviewsScreen extends StatelessWidget {
  const AllReviewsScreen({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.reviews),
        centerTitle: true,
      ),
    );
  }
}
