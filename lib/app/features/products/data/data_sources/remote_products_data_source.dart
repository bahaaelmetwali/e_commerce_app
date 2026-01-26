import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/core/constants/constants.dart';
import 'package:mega/app/features/products/data/models/product_model.dart';
import 'package:mega/app/features/products/domain/use_cases/get_products_use_case.dart';

import '../../../../core/helper/api_helper.dart';
import '../../domain/use_cases/create_product_use_case.dart';
import '../../domain/use_cases/delete_product_use_case.dart';
import '../../domain/use_cases/get_product_use_case.dart';
import '../../domain/use_cases/update_product_use.dart';

abstract class RemoteProductsDataSource {
  Future<List<ProductModel>> getProducts({GetProductsParams? params});

  Future<List<ProductModel>> getMyProducts();

  Future<ProductModel> getProduct(GetProductParams params);
  Future<Unit> addProduct(CreateProductParams params);

  Future<Unit> updateProduct(UpdateProductParams params);

  Future<Unit> deleteProduct(DeleteProductParams params);
}

@Injectable(as: RemoteProductsDataSource)
class RemoteProductsDataSourceImpl implements RemoteProductsDataSource {
  final ApiHelper apiHelper;
  RemoteProductsDataSourceImpl({required this.apiHelper});
  @override
  Future<List<ProductModel>> getProducts({GetProductsParams? params}) async {
    final response = await apiHelper.get(
      endPoint: Constants.getProductsEndPoint,
      queryParameters: params?.toQuery(),
    );
    List<ProductModel> products = (response['products'] as List)
        .map((productJson) => ProductModel.fromJson(productJson))
        .toList();
    return Future.value(products);
  }

  @override
  Future<List<ProductModel>> getMyProducts() async {
    final response = await apiHelper.get(
      endPoint: Constants.getMyProductsEndPoint,
    );
    List<ProductModel> products = (response['products'] as List)
        .map((productJson) => ProductModel.fromJson(productJson))
        .toList();
    return Future.value(products);
  }

  @override
  Future<Unit> addProduct(CreateProductParams params) async {
    await apiHelper.post(
      endPoint: Constants.getProductsEndPoint,

      json: params.toMap(),
    );
    return Future.value(unit);
  }

  @override
  Future<Unit> deleteProduct(DeleteProductParams params) async {
    await apiHelper.delete(
      endPoint: '${Constants.getProductsEndPoint}/${params.productId}',
    );
    return Future.value(unit);
  }

  @override
  Future<ProductModel> getProduct(GetProductParams params) async {
    final response = await apiHelper.get(
      endPoint: '${Constants.getProductsEndPoint}/${params.productId}',
    );
    return Future.value(ProductModel.fromJson(response));
  }

  @override
  Future<Unit> updateProduct(UpdateProductParams params) async {
    await apiHelper.put(
      endPoint: '${Constants.getProductsEndPoint}/${params.productId}',
      json: params.toMap(),
    );
    return Future.value(unit);
  }
}
