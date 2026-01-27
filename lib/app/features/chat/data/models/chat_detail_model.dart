import 'package:mega/app/features/chat/data/models/chat_message_model.dart';
import 'package:mega/app/features/chat/data/models/chat_user_model.dart';
import 'package:mega/app/features/chat/domain/entities/chat_detail_entity.dart';

class ChatDetailModel {
  final String chatId;
  final ChatUserModel currentUser;
  final ChatUserModel otherUser;
  final List<ChatMessageModel> messages;

  ChatDetailModel({
    required this.chatId,
    required this.currentUser,
    required this.otherUser,
    required this.messages,
  });

  factory ChatDetailModel.fromJson(Map<String, dynamic> json) => ChatDetailModel(
        chatId: json['chatId'],
        currentUser: ChatUserModel.fromJson(json['currentUser']),
        otherUser: ChatUserModel.fromJson(json['otherUser']),
        messages: List<ChatMessageModel>.from(
          (json['messages'] ?? []).map((m) => ChatMessageModel.fromJson(m)),
        ),
      );

  Map<String, dynamic> toJson() => {
        'chatId': chatId,
        'currentUser': currentUser.toJson(),
        'otherUser': otherUser.toJson(),
        'messages': messages.map((m) => m.toJson()).toList(),
      };

  ChatDetailEntity toEntity() => ChatDetailEntity(
        chatId: chatId,
        currentUser: currentUser.toEntity(),
        otherUser: otherUser.toEntity(),
        messages: messages.map((m) => m.toEntity()).toList(),
      );
}
