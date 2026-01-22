import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/products/domain/entities/product_entity.dart'
    show ProductEntity;
import 'package:mega/app/features/products/domain/use_cases/get_product_use_case.dart';

import '../../../../../core/errors/failure.dart';

part 'get_product_state.dart';

@injectable
class GetProductCubit extends Cubit<GetProductState> {
  GetProductCubit(this.getProductUseCase) : super(GetProductInitial());
  final GetProductUseCase getProductUseCase;
  Future<void> getProduct(GetProductParams params) async {
    emit(GetProductLoading());
    final result = await getProductUseCase.call(params);
    result.fold(
      (failure) => emit(GetProductFailure(failure)),
      (product) => emit(GetProductSuccess(product)),
    );
  }
}
