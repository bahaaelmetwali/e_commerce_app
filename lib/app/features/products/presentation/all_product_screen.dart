import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/core/constants/dimensions.dart';
import 'package:mega/app/features/products/presentation/widgets/product_card.dart';
import 'package:mega/app/material/textfields/custom_text_field.dart';
import 'package:mega/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../core/config/theme/app_colors.dart';
import '../../../core/di/injection.dart';
import '../../favorites/presentation/cubits/favorite/favorite_cubit.dart';
import '../domain/use_cases/get_products_use_case.dart';
import 'cubits/get_products/get_products_cubit.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  late final TextEditingController searchController;
  Timer? _searchDebounce;
  void startDebounce(VoidCallback callback) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 500), callback);
  }

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetProductsCubit>(
          create: (_) => getIt<GetProductsCubit>()..getProducts(),
        ),
        BlocProvider(create: (context) => getIt<FavoriteCubit>()),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.allProducts),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingMedium,
              ),
              child: Column(
                children: [
                  CustomTextField(
                    onChanged: (value) {
                      startDebounce(() {
                        context.read<GetProductsCubit>().getProducts(
                          params: GetProductsParams(keyword: value),
                        );
                      });
                    },
                    hintText: AppLocalizations.of(context)!.search,
                    prefixIcon: const Icon(Icons.search),
                    controller: searchController,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        searchController.clear();
                        context.read<GetProductsCubit>().getProducts(
                          params: const GetProductsParams(keyword: ''),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  Expanded(
                    child: BlocBuilder<GetProductsCubit, GetProductsState>(
                      builder: (context, state) {
                        if (state is GetProductsLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          );
                        }

                        if (state is GetProductsFailure) {
                          return Center(child: Text(state.failure.message));
                        }

                        if (state is GetProductsSuccess) {
                          final products = state.products;

                          if (products.isEmpty) {
                            return Center(
                              child: Text(
                                AppLocalizations.of(context)!.noProductsFound,
                              ),
                            );
                          }

                          return GridView.builder(
                            itemCount: products.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  childAspectRatio: 0.57,
                                ),
                            itemBuilder: (context, index) {
                              return ProductCard(product: products[index]);
                            },
                          );
                        }

                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
