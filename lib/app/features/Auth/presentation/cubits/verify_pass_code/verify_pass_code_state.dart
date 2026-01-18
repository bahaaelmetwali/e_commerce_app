part of 'verify_pass_code_cubit.dart';

sealed class VerifyPassCodeState extends Equatable {
  const VerifyPassCodeState();

  @override
  List<Object> get props => [];
}

final class VerifyPassCodeInitial extends VerifyPassCodeState {}

final class VerifyPassCodeLoading extends VerifyPassCodeState {}

final class VerifyPassCodeSuccess extends VerifyPassCodeState {}
final class VerifyPassCodeFailure extends VerifyPassCodeState {
  final String errorMessage;
  const VerifyPassCodeFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
