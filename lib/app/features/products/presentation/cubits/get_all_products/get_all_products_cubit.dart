import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/products/domain/use_cases/get_all_products_use_case.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/product_entity.dart';

part 'get_all_products_state.dart';

@injectable
class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit(this.getAllProductsUseCase)
    : super(GetAllProductsInitial());
  final GetAllProductsUseCase getAllProductsUseCase;

  Future<void> getAllProducts() async {
    emit(GetAllProductsLoading());
    final result = await getAllProductsUseCase.call();
    result.fold(
      (failure) => emit(GetAllProductsFailure(failure)),
      (products) => emit(GetAllProductsSuccess(products)),
    );
  }
}
