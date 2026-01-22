import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/products/domain/use_cases/create_product_use_case.dart';

import '../../../../../core/errors/failure.dart';

part 'add_product_state.dart';

@injectable
class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.addProductUseCase) : super(AddProductInitial());
  final AddProductUseCase addProductUseCase;

  Future<void> addProduct(CreateProductParams params) async {
    emit(AddProductLoading());
    final result = await addProductUseCase.call(params);
    result.fold(
      (failure) => emit(AddProductError(failure)),
      (_) => emit(AddProductSuccess()),
    );
  }
}
