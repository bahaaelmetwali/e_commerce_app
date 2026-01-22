part of 'update_product_cubit.dart';

sealed class UpdateProductState extends Equatable {
  const UpdateProductState();

  @override
  List<Object> get props => [];
}

final class UpdateProductInitial extends UpdateProductState {}
final class UpdateProductLoading extends UpdateProductState {}
final class UpdateProductSuccess extends UpdateProductState {
  const UpdateProductSuccess();
}
final class UpdateProductFailure extends UpdateProductState {
  final Failure failure;
  const UpdateProductFailure(this.failure);
  @override
  List<Object> get props => [failure];
}
