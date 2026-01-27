part of 'send_by_user_id_cubit.dart';

sealed class SendByUserIdState extends Equatable {
  const SendByUserIdState();

  @override
  List<Object> get props => [];
}

final class SendByUserIdInitial extends SendByUserIdState {}

final class SendByUserIdLoading extends SendByUserIdState {}

final class SendByUserIdSuccess extends SendByUserIdState {
  const SendByUserIdSuccess();

  @override
  List<Object> get props => [];
}

final class SendByUserIdError extends SendByUserIdState {
  final String message;
  const SendByUserIdError({required this.message});

  @override
  List<Object> get props => [message];
}
