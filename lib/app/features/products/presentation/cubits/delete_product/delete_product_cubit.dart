import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/use_cases/delete_product_use_case.dart';

part 'delete_product_state.dart';

@injectable
class DeleteProductCubit extends Cubit<DeleteProductState> {
  DeleteProductCubit(this.deleteProductUseCase) : super(DeleteProductInitial());
  final DeleteProductUseCase deleteProductUseCase;
  Future<void> deleteProduct(DeleteProductParams params) async {
    emit(DeleteProductLoading());
    final result = await deleteProductUseCase.call(params);
    result.fold(
      (failure) => emit(DeleteProductFailure(failure)),
      (_) => emit(DeleteProductSuccess()),
    );
  }
}
