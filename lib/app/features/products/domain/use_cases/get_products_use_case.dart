import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/products/domain/repos/products_repo.dart';

import '../../../../core/errors/failure.dart';
import '../entities/product_entity.dart';

@singleton
class GetProductsUseCase {
  final ProductsRepo repository;
  GetProductsUseCase(this.repository);
  Future<Either<Failure, List<ProductEntity>>> call(GetProductsParams? params) async {
    return await repository.getProducts(
      params: params,
    );
  }
}

class GetProductsParams {
  final int? pageNumber;
  final String? keyword;

  const GetProductsParams({
    this.pageNumber,
    this.keyword,
  });

  Map<String, dynamic> toQuery() {
    final query = <String, dynamic>{};

    if (pageNumber != null) {
      query['pageNumber'] = pageNumber;
    }

    if (keyword != null && keyword!.isNotEmpty) {
      query['keyword'] = keyword;
    }

    return query;
  }
}
