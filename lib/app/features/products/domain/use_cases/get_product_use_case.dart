import 'package:injectable/injectable.dart';
import 'package:mega/app/features/products/domain/repos/products_repo.dart';

@singleton
class GetProductUseCase {
  final ProductsRepo repository;
  GetProductUseCase(this.repository);
  Future call(GetProductParams params) async {
    return await repository.getProduct(params);
  }
}

class GetProductParams {
  final String productId;

  GetProductParams({required this.productId});
  Map<String, dynamic> toMap() {
    return {'id': productId};
  }
}
