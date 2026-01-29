import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/review/domain/use_cases/add_review_use_case.dart';

part 'add_review_state.dart';

@injectable
class AddReviewCubit extends Cubit<AddReviewState> {
  AddReviewCubit(this.addReviewUseCase) : super(AddReviewInitial());
final AddReviewUseCase addReviewUseCase;
  Future<void> addReview(AddReviewParams params) async {
    emit(AddReviewLoading());
    final result = await addReviewUseCase(params);
    result.fold(
      (failure) => emit(AddReviewError(message: failure.message)),
      (_) => emit(AddReviewSuccess()),
    );
  }
}
