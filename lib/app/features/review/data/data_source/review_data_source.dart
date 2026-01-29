import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/core/constants/constants.dart';
import 'package:mega/app/core/helper/api_helper.dart';
import 'package:mega/app/features/review/data/models/review_model.dart';
import 'package:mega/app/features/review/domain/use_cases/add_review_use_case.dart';
import 'package:mega/app/features/review/domain/use_cases/get_product_reviews_use_case.dart';

abstract class ReviewDataSource {
  Future<Unit> addReview(AddReviewParams params);
  Future<List<ReviewModel>> getProductReviews(GetProductReviewsParams params);
}

@Injectable(as: ReviewDataSource)
class ReviewDataSourceImpl implements ReviewDataSource {
  final ApiHelper apiHelper;

  ReviewDataSourceImpl(this.apiHelper);
  @override
  Future<Unit> addReview(AddReviewParams params) {
    apiHelper.post(
      endPoint: "${Constants.getProductsEndPoint}/${params.productId}/reviews",
      json: params.toJson(),
    );
    return Future.value(unit);
  }

  @override
  Future<List<ReviewModel>> getProductReviews(
    GetProductReviewsParams params,
  ) async {
    return await apiHelper.get(
      endPoint: "${Constants.getProductsEndPoint}/${params.productId}/reviews",
    );
  }
}
