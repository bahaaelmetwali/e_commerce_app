import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/products/domain/entities/product_entity.dart';

import '../../../domain/use_cases/get_my_products_use_case.dart';

part 'get_my_products_state.dart';

@injectable
class GetMyProductsCubit extends Cubit<GetMyProductsState> {
  GetMyProductsCubit(this.getMyProductsUseCase) : super(GetMyProductsInitial());
  final GetMyProductsUseCase getMyProductsUseCase;
  Future<void> getMyProducts() async {
    emit(GetMyProductsLoading());
    final result = await getMyProductsUseCase.call();
    result.fold(
      (failure) => emit(GetMyProductsFailure()),
      (products) => emit(GetMyProductsSuccess(products)),
    );
  }
}
