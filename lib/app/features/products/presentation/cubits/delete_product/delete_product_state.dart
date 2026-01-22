part of 'delete_product_cubit.dart';

sealed class DeleteProductState extends Equatable {
  const DeleteProductState();

  @override
  List<Object> get props => [];
}

final class DeleteProductInitial extends DeleteProductState {}

final class DeleteProductLoading extends DeleteProductState {}

final class DeleteProductSuccess extends DeleteProductState {
  const DeleteProductSuccess();
}

final class DeleteProductFailure extends DeleteProductState {
  final Failure failure;
  const DeleteProductFailure(this.failure);
  @override
  List<Object> get props => [failure];
}
