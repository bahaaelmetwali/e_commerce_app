import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/core/data/domain/use_cases/get_user_info_use_case.dart';
import 'package:mega/app/core/helper/pusher_config.dart';
import 'package:mega/app/features/chat/data/models/chat_message_model.dart';

import 'package:mega/app/features/chat/domain/use_cases/fetch_chat_by_user_id_use_case.dart';

import '../../../domain/entities/chat_detail_entity.dart';
import '../../../domain/entities/chat_message_entity.dart';

part 'get_chat_by_user_id_state.dart';

@injectable
class GetChatByUserIdCubit extends Cubit<GetChatByUserIdState> {
  GetChatByUserIdCubit(
    this.fetchChatByUserIdUseCase, {
    required this.getUserInfoUseCase,
  }) : super(GetChatByUserIdInitial());

  final FetchChatByUserIdUseCase fetchChatByUserIdUseCase;
  final GetUserInfoUseCase getUserInfoUseCase;
  ChatDetailEntity? _cachedChat;

  Future<void> fetchChatByUserId(String userId) async {
    emit(GetChatByUserIdLoading());

    final result = await fetchChatByUserIdUseCase.call(userId);

    result.fold(
      (failure) {
        emit(GetChatByUserIdError(message: failure.toString()));
      },
      (chatDetail) async {
        emit(GetChatByUserIdSuccess(chatDetail: chatDetail));
        _cachedChat = chatDetail;
        await subscribe(
          channelName: "conversation-",
          roomId: chatDetail.chatId,
          onEvent: (data) {
            onNewMessage(data);
          },
        );
      },
    );
  }

  Future<void> onNewMessage(dynamic event) async {
    try {
      final eventData = (event as dynamic).data as String;
      final Map<String, dynamic> messageJson = jsonDecode(eventData);

      final message = ChatMessageModel.fromPusherJson(
        messageJson,
        (await getUserInfoUseCase.call()).fold((l) => '', (user) => user!.id),
      );

      final newMessage = message.toEntity();

      if (_cachedChat == null) return;

      final updatedMessages = List<ChatMessageEntity>.from(
        _cachedChat!.messages,
      )..add(newMessage);

      _cachedChat = _cachedChat!.copyWith(messages: updatedMessages);

      emit(GetChatByUserIdSuccess(chatDetail: _cachedChat!));
    } catch (e) {
      log("⚠️ Failed to parse new message: $event, error: $e");
    }
  }

  Future<void> subscribe({
    required String channelName,
    required String roomId,
    required Function(dynamic data) onEvent,
  }) async {
    await PusherConfig().initPusher(
      channelName: channelName,
      roomId: roomId,
      onEvent: (eventData) {
        onEvent(eventData);
      },
    );

  }
}
