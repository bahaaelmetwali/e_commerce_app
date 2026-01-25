import 'package:dartz/dartz.dart';
import 'package:mega/app/features/products/domain/use_cases/delete_product_use_case.dart';

import '../../../../core/errors/failure.dart';
import '../entities/product_entity.dart';
import '../use_cases/create_product_use_case.dart';
import '../use_cases/get_products_use_case.dart';
import '../use_cases/get_product_use_case.dart';
import '../use_cases/update_product_use.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts({GetProductsParams? params});

  Future<Either<Failure, List<ProductEntity>>> getMyProducts();

  Future<Either<Failure, ProductEntity>> getProduct(GetProductParams params);
  Future<Either<Failure, Unit>> addProduct(CreateProductParams params);

  Future<Either<Failure, Unit>> updateProduct(UpdateProductParams params);

  Future<Either<Failure, Unit>> deleteProduct(DeleteProductParams params);
}
