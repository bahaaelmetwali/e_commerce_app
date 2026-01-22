part of 'get_all_products_cubit.dart';

sealed class GetAllProductsState extends Equatable {
  const GetAllProductsState();

  @override
  List<Object> get props => [];
}

final class GetAllProductsInitial extends GetAllProductsState {}

final class GetAllProductsLoading extends GetAllProductsState {}

final class GetAllProductsSuccess extends GetAllProductsState {
  final List<ProductEntity> products;
  const GetAllProductsSuccess(this.products);

  @override
  List<Object> get props => [products];
}

final class GetAllProductsFailure extends GetAllProductsState {
  final Failure failure;
  const GetAllProductsFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
