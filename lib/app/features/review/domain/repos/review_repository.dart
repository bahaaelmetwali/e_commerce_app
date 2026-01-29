import 'package:dartz/dartz.dart';
import 'package:mega/app/features/review/domain/use_cases/add_review_use_case.dart';

import '../../../../core/errors/failure.dart';
import '../entities/review_entity.dart';
import '../use_cases/get_product_reviews_use_case.dart';

abstract class ReviewRepository {
  Future<Either<Failure, Unit>> addReview(AddReviewParams params);
  Future<Either<Failure, List<ReviewEntity>>> getProductReviews(
    GetProductReviewsParams params,
  );
}
