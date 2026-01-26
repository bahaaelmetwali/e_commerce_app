import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/core/constants/constants.dart';
import 'package:mega/app/core/helper/api_helper.dart';
import 'package:mega/app/features/products/data/models/product_model.dart';

import '../../domain/use_cases/toggle_favorite_use_case.dart';

abstract class FavoritesDataSource {
  Future<Unit> toggleFavorite(ToggleFavoriteParams params);
  Future<List<ProductModel>> getFavorites();
}

@Injectable(as: FavoritesDataSource)
class FavoritesDataSourceImpl implements FavoritesDataSource {
  final ApiHelper apiHelper;
  FavoritesDataSourceImpl(this.apiHelper);
  @override
  Future<List<ProductModel>> getFavorites() async {
    final response = await apiHelper.get(
      endPoint: Constants.getFavoritesEndPoint,
    );
    final productsData = response['data'] as List;
    final products = productsData
        .map((productJson) => ProductModel.fromJson(productJson))
        .toList();
    return products;
  }

  @override
  Future<Unit> toggleFavorite(ToggleFavoriteParams params) {
    return apiHelper
        .post(
          endPoint:
              '${Constants.getProductsEndPoint}/${params.productId}/favorite',
        )
        .then((_) => unit);
  }
}
