part of 'update_email_cubit.dart';

sealed class UpdateEmailState extends Equatable {
  const UpdateEmailState();

  @override
  List<Object> get props => [];
}

final class UpdateEmailInitial extends UpdateEmailState {}

final class UpdateEmailLoading extends UpdateEmailState {}

final class UpdateEmailSuccess extends UpdateEmailState {}

final class UpdateEmailFailure extends UpdateEmailState {
  final Failure failure;
  const UpdateEmailFailure({required this.failure});

  @override
  List<Object> get props => [failure];
  }
