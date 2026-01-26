import 'package:flutter/material.dart';

class AllReviewsScreen extends StatelessWidget {
  const AllReviewsScreen({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('All Reviews Screen'),
      ),
    );
  }
}
