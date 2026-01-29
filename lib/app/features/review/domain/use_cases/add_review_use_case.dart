import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../repos/review_repository.dart';

@singleton
class AddReviewUseCase {
  final ReviewRepository reviewRepository;
  AddReviewUseCase(this.reviewRepository);
  Future<Either<Failure, Unit>> call(AddReviewParams params) async {
    return await reviewRepository.addReview(params);
  }
}

class AddReviewParams {
  final String productId;
  final String comment;
  final int rating;

  AddReviewParams({
    required this.productId,
    required this.comment,
    required this.rating,
  });
  Map<String, dynamic> toJson() {
    return {'rating': rating, 'comment': comment};
  }
}
