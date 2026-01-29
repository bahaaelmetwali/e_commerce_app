import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../entities/review_entity.dart';
import '../repos/review_repository.dart';

@singleton
class GetProductReviewsUseCase {
  final ReviewRepository reviewRepository;
  GetProductReviewsUseCase(this.reviewRepository);
  Future<Either<Failure, List<ReviewEntity>>> call(
    GetProductReviewsParams params,
  ) async {
    return await reviewRepository.getProductReviews(params);
  }
}

class GetProductReviewsParams {
  final String productId;

  GetProductReviewsParams({required this.productId});
}
