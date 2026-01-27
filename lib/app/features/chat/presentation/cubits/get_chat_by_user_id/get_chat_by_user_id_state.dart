part of 'get_chat_by_user_id_cubit.dart';

sealed class GetChatByUserIdState extends Equatable {
  const GetChatByUserIdState();

  @override
  List<Object> get props => [];
}

final class GetChatByUserIdInitial extends GetChatByUserIdState {}

final class GetChatByUserIdLoading extends GetChatByUserIdState {}

final class GetChatByUserIdSuccess extends GetChatByUserIdState {
  final ChatDetailEntity chatDetail;
  const GetChatByUserIdSuccess({required this.chatDetail});

  @override
  List<Object> get props => [chatDetail];
}

final class GetChatByUserIdError extends GetChatByUserIdState {
  final String message;
  const GetChatByUserIdError({required this.message});

  @override
  List<Object> get props => [message];
}
