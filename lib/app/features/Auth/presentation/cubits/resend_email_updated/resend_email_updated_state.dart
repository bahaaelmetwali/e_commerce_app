part of 'resend_email_updated_cubit.dart';

sealed class ResendEmailUpdatedState extends Equatable {
  const ResendEmailUpdatedState();

  @override
  List<Object> get props => [];
}

final class ResendEmailUpdatedInitial extends ResendEmailUpdatedState {}

final class ResendEmailUpdatedLoading extends ResendEmailUpdatedState {}
final class ResendEmailUpdatedSuccess extends ResendEmailUpdatedState {}
final class ResendEmailUpdatedFailure extends ResendEmailUpdatedState {
  final Failure failure;

  const ResendEmailUpdatedFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}
