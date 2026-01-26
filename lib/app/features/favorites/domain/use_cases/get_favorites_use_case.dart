import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../repos/favorites_repo.dart';

@singleton
class GetFavoritesUseCase {
  final FavoritesRepo favoritesRepo;
  GetFavoritesUseCase({required this.favoritesRepo});
  Future<Either<Failure, List<ProductEntity>>> call() async {
    final result = await favoritesRepo.getFavorites();
    return result;
  }
}
