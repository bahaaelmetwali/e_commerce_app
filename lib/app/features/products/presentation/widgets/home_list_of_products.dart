import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:mega/app/features/products/presentation/cubits/get_products/get_products_cubit.dart';
import 'package:mega/app/features/products/presentation/widgets/product_card.dart';
import '../../domain/use_cases/get_products_use_case.dart';

class HomeListOfProducts extends StatefulWidget {
  const HomeListOfProducts({super.key});

  @override
  State<HomeListOfProducts> createState() => _HomeListOfProductsState();
}

class _HomeListOfProductsState extends State<HomeListOfProducts> {
  @override
  void initState() {
    super.initState();
    context.read<GetProductsCubit>().getProducts(
      params: GetProductsParams(pageNumber: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        }

        if (state is GetProductsFailure) {
          return Center(child: Text(state.failure.message));
        }

        if (state is GetProductsSuccess) {
          final products = state.products;

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.57,
            ),
            itemBuilder: (context, index) {
              final product = products[index];

              return ProductCard(product: product);
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
