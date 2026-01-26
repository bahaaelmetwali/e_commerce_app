import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mega/app/features/favorites/domain/use_cases/get_favorites_use_case.dart';

import '../../../../products/domain/entities/product_entity.dart';
import '../../../domain/use_cases/toggle_favorite_use_case.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.getFavoritesUseCase, this.toggleFavoriteUseCase)
    : super(FavoriteInitial());
  final GetFavoritesUseCase getFavoritesUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;
}
