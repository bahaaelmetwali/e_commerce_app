part of 'get_product_cubit.dart';

sealed class GetProductState extends Equatable {
  const GetProductState();

  @override
  List<Object> get props => [];
}

final class GetProductInitial extends GetProductState {}

final class GetProductLoading extends GetProductState {}

final class GetProductSuccess extends GetProductState {
  final ProductEntity product;
  const GetProductSuccess(this.product);

  @override
  List<Object> get props => [product];
}

final class GetProductFailure extends GetProductState {
  final Failure failure;
  const GetProductFailure(this.failure);


  @override
  List<Object> get props => [failure];
}
