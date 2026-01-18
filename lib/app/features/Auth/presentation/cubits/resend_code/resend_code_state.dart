part of 'resend_code_cubit.dart';

sealed class ResendCodeState extends Equatable {
  const ResendCodeState();

  @override
  List<Object> get props => [];
}

final class ResendCodeInitial extends ResendCodeState {}

final class ResendCodeLoading extends ResendCodeState {}

final class ResendCodeSuccess extends ResendCodeState {}

final class ResendCodeFailure extends ResendCodeState {
  final String errorMessage;
  const ResendCodeFailure({required this.errorMessage});
}
