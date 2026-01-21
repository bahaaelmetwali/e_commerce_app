import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/products/domain/repos/products_repo.dart';

import '../../../../core/errors/failure.dart';
import '../entities/product_entity.dart';

@singleton
class GetAllProductsUseCase {
  final ProductsRepo repository;
  GetAllProductsUseCase(this.repository);
  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await repository.getAllProducts();
  }
}
