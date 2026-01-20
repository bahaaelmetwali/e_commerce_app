part of 'verify_email_updated_cubit.dart';

sealed class VerifyEmailUpdatedState extends Equatable {
  const VerifyEmailUpdatedState();

  @override
  List<Object> get props => [];
}

final class VerifyEmailUpdatedInitial extends VerifyEmailUpdatedState {}
final class VerifyEmailUpdatedLoading extends VerifyEmailUpdatedState {
}

final class VerifyEmailUpdatedSuccess extends VerifyEmailUpdatedState {
}

final class VerifyEmailUpdatedFailure extends VerifyEmailUpdatedState {
  final Failure failure;

  const VerifyEmailUpdatedFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}