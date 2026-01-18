part of 'verify_email_cubit.dart';

sealed class VerifyEmailState extends Equatable {
  const VerifyEmailState();

  @override
  List<Object> get props => [];
}

final class VerifyEmailInitial extends VerifyEmailState {}

final class VerifyEmailLoading extends VerifyEmailState {}

final class VerifyEmailSuccess extends VerifyEmailState {}

final class VerifyEmailFailure extends VerifyEmailState {
  final String errorMessage;
const VerifyEmailFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
  }
