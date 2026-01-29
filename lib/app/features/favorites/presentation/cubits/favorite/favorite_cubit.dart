import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/favorites/domain/use_cases/get_favorites_use_case.dart';

import '../../../../products/domain/entities/product_entity.dart';
import '../../../domain/use_cases/toggle_favorite_use_case.dart';

part 'favorite_state.dart';

@injectable
class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.getFavoritesUseCase, this.toggleFavoriteUseCase)
    : super(FavoriteState.initial());

  final GetFavoritesUseCase getFavoritesUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;

  Future<void> getFavorites() async {
    emit(state.copyWith(status: FavoriteStatus.loading));

    final result = await getFavoritesUseCase();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: FavoriteStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (favorites) {
        emit(
          state.copyWith(status: FavoriteStatus.success, favorites: favorites),
        );
      },
    );
  }

  Future<void> toggleFavorite(ProductEntity product) async {
    final result = await toggleFavoriteUseCase(
      ToggleFavoriteParams(productId: product.id),
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: FavoriteStatus.error,
            errorMessage: failure.message,
          ),
        );
      },
      (_) {
        final updatedList = state.favorites.any((p) => p.id == product.id)
            ? state.favorites.where((p) => p.id != product.id).toList()
            : [...state.favorites, product];

        emit(
          state.copyWith(
            status: FavoriteStatus.success,
            favorites: updatedList,
          ),
        );
        getFavorites();
      },
    );
  }
}
