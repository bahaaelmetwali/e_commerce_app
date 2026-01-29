import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/review/domain/use_cases/get_product_reviews_use_case.dart';

import '../../../domain/entities/review_entity.dart';

part 'get_reviews_state.dart';
@injectable
class GetReviewsCubit extends Cubit<GetReviewsState> {
  GetReviewsCubit(this.getProductReviewsUseCase) : super(GetReviewsInitial());
  final GetProductReviewsUseCase getProductReviewsUseCase;
Future<void> getReviews(GetProductReviewsParams params) async {
    emit(GetReviewsLoading());
    final result = await getProductReviewsUseCase(params);
    result.fold(
      (failure) => emit(GetReviewsError(message: failure.message)),
      (reviews) => emit(GetReviewsSuccess(reviews: reviews)),
    );
  }
}
