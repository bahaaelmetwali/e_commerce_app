import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../repos/products_repo.dart';

@singleton
class DeleteProductUseCase {
  final ProductsRepo repository;
  DeleteProductUseCase(this.repository);
  Future<Either<Failure, Unit>> call(DeleteProductParams params) async {
    return await repository.deleteProduct(params);
  }
}

class DeleteProductParams {
  final String productId;

  DeleteProductParams({required this.productId});
  Map<String, dynamic> toMap() {
    return {
      'id': productId,
    };
  }
}
