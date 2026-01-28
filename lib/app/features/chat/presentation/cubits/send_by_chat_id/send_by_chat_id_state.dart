part of 'send_by_chat_id_cubit.dart';

sealed class SendByChatIdState extends Equatable {
  const SendByChatIdState();

  @override
  List<Object> get props => [];
}

final class SendByChatIdInitial extends SendByChatIdState {}
final class SendByChatIdLoading extends SendByChatIdState {}
final class SendByChatIdSuccess extends SendByChatIdState {
  const SendByChatIdSuccess();

  @override
  List<Object> get props => [];
}
final class SendByChatIdError extends SendByChatIdState {
  final String message;
  const SendByChatIdError({required this.message});

  @override
  List<Object> get props => [message];
}
