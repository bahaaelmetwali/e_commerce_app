import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/app/features/favorites/presentation/cubits/favorite/favorite_cubit.dart';
import 'package:mega/app/features/products/presentation/widgets/product_card.dart';
import 'package:mega/l10n/app_localizations.dart';

import '../../../core/di/injection.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FavoriteCubit>()..getFavorites(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.favorite),
          centerTitle: true,
        ),
        body: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state.status == FavoriteStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == FavoriteStatus.error) {
              return Center(child: Text(state.errorMessage ?? 'Error'));
            } else if (state.status == FavoriteStatus.success &&
                state.favorites.isEmpty) {
              return Center(
                child: Text(AppLocalizations.of(context)!.noProductsFound),
              );
            } else if (state.status == FavoriteStatus.success) {
              return ListView.builder(
                itemCount: state.favorites.length,
                itemBuilder: (context, index) {
                  final product = state.favorites[index];
                  return ProductCard(product: product);
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
