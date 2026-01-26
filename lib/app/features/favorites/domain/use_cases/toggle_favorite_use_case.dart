import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../repos/favorites_repo.dart';

@injectable
class ToggleFavoriteUseCase {
  final FavoritesRepo favoritesRepo;
  ToggleFavoriteUseCase({required this.favoritesRepo});
  Future<Either<Failure, Unit>> call(ToggleFavoriteParams params) async {
    return favoritesRepo.toggleFavorite(params);
  }
}
class ToggleFavoriteParams {
  final String productId;
  ToggleFavoriteParams({required this.productId});
 Map<String, dynamic> toMap() {
    return {
      'productId': productId,
    };
  }
}
