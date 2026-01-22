import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/products/domain/use_cases/update_product_use.dart';

import '../../../../../core/errors/failure.dart';

part 'update_product_state.dart';

@injectable
class UpdateProductCubit extends Cubit<UpdateProductState> {
  UpdateProductCubit(this.updateProductUse) : super(UpdateProductInitial());
  final UpdateProductUse updateProductUse;
  Future<void> updateProduct(UpdateProductParams params) async {
    emit(UpdateProductLoading());
    final result = await updateProductUse.call(params);
    result.fold(
      (failure) => emit(UpdateProductFailure(failure)),
      (_) => emit(UpdateProductSuccess()),
    );
  }
}
