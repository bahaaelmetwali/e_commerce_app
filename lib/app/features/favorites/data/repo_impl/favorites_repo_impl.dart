import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:mega/app/core/errors/failure.dart';
import 'package:mega/app/core/utils/request_handler.dart';
import 'package:mega/app/features/favorites/domain/repos/favorites_repo.dart';


import '../../../products/domain/entities/product_entity.dart';
import '../../domain/use_cases/toggle_favorite_use_case.dart';
import '../data_source/favorites_data_source.dart';

@Injectable(as: FavoritesRepo)
class FavoritesRepoImpl implements FavoritesRepo {
  final FavoritesDataSource favoritesDataSource;
  FavoritesRepoImpl({required this.favoritesDataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> getFavorites() async {
    return requestHandler(
      request: () async {
        final result = await favoritesDataSource.getFavorites();
        List<ProductEntity> products = result
            .map((e) => e as ProductEntity)
            .toList();
        return products;
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> toggleFavorite(ToggleFavoriteParams params) {
    return requestHandler(
      request: () async {
        final result = await favoritesDataSource.toggleFavorite(params);
        return result;
      },
    );
  }
}
