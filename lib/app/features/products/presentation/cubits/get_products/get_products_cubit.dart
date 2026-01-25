import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/products/domain/use_cases/get_products_use_case.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/product_entity.dart';

part 'get_products_state.dart';

@injectable
class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(this.getProductsUseCase)
    : super(GetProductsInitial());
  final GetProductsUseCase getProductsUseCase;

  Future<void> getProducts({GetProductsParams? params}) async {
    emit(GetProductsLoading());
    final result = await getProductsUseCase.call( params);
    result.fold(
      (failure) => emit(GetProductsFailure(failure)),
      (products) => emit(GetProductsSuccess(products)),
    );
  }
}
