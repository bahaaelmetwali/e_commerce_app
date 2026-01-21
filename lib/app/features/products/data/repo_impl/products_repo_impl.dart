import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:mega/app/core/errors/failure.dart';
import 'package:mega/app/core/utils/request_handler.dart';

import 'package:mega/app/features/products/domain/entities/product_entity.dart';

import 'package:mega/app/features/products/domain/use_cases/create_product_use_case.dart';

import 'package:mega/app/features/products/domain/use_cases/delete_product_use_case.dart';

import 'package:mega/app/features/products/domain/use_cases/get_product_use_case.dart';

import 'package:mega/app/features/products/domain/use_cases/update_product_use.dart';

import '../../domain/repos/products_repo.dart';
import '../data_sources/remote_products_data_source.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl extends ProductsRepo {
  final RemoteProductsDataSource remoteDataSource;
  ProductsRepoImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, Unit>> addProduct(CreateProductParams params) async {
    return requestHandler(
      request: () async {
        return await remoteDataSource.addProduct(params);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(
    DeleteProductParams params,
  ) async {
    return requestHandler(
      request: () async {
        return await remoteDataSource.deleteProduct(params);
      },
    );
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    return requestHandler(
      request: () async {
        final response = await remoteDataSource.getAllProducts();
        return response.map((productModel) => productModel.toEntity()).toList();
      },
    );
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getMyProducts() async {
    return requestHandler(
      request: () async {
        final response = await remoteDataSource.getMyProducts();
        return response.map((productModel) => productModel.toEntity()).toList();
      },
    );
  }

  @override
  Future<Either<Failure, ProductEntity>> getProduct(GetProductParams params) {
    return requestHandler(
      request: () async {
        final response = await remoteDataSource.getProduct(params);
        return response.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> updateProduct(
    UpdateProductParams params,
  ) async {
    return requestHandler(
      request: () async {
        return await remoteDataSource.updateProduct(params);
      },
    );
  }
}
