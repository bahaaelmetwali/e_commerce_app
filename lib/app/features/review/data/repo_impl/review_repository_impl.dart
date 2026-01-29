import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:mega/app/core/errors/failure.dart';
import 'package:mega/app/core/utils/request_handler.dart';

import 'package:mega/app/features/review/domain/entities/review_entity.dart';

import 'package:mega/app/features/review/domain/use_cases/add_review_use_case.dart';
import 'package:mega/app/features/review/domain/use_cases/get_product_reviews_use_case.dart';

import '../../domain/repos/review_repository.dart';
import '../data_source/review_data_source.dart';

@Injectable(as: ReviewRepository)
class ReviewRepositoryImpl implements ReviewRepository {
  final ReviewDataSource reviewDataSource;
  ReviewRepositoryImpl(this.reviewDataSource);
  @override
  Future<Either<Failure, Unit>> addReview(AddReviewParams params) {
    return requestHandler(
      request: () async {
        return await reviewDataSource.addReview(params);
      },
    );
  }

  @override
  Future<Either<Failure, List<ReviewEntity>>> getProductReviews(
    GetProductReviewsParams params,
  ) async {
    return requestHandler(
      request: () async {
        return await reviewDataSource.getProductReviews(params);
      },
    );
  }
}
