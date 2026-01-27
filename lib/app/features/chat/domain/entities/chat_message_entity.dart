import 'package:mega/app/features/chat/domain/entities/chat_user_entity.dart';

class ChatMessageEntity {
  final String id;
  final String chatId;
  final ChatUserEntity sender;
  final String text;
  final List<String> media;
  final MessageStatus status;
  final List<String> readBy;
  final DateTime createdAt;
  final bool isMine;

  const ChatMessageEntity({
    required this.id,
    required this.chatId,
    required this.sender,
    required this.text,
    required this.media,
    required this.status,
    required this.readBy,
    required this.createdAt,
    required this.isMine,
  });
}

enum MessageStatus {
  sent,
  delivered,
  seen,
}