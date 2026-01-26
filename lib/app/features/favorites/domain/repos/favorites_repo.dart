// ignore: file_names
import 'package:dartz/dartz.dart';
import 'package:mega/app/features/products/domain/entities/product_entity.dart';

import '../../../../core/errors/failure.dart';
import '../use_cases/toggle_favorite_use_case.dart';

abstract class FavoritesRepo {
  Future<Either<Failure, Unit>> toggleFavorite(ToggleFavoriteParams params);
  Future<Either<Failure, List<ProductEntity>>> getFavorites();
}
