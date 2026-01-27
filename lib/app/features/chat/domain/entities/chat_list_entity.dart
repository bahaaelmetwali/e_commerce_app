import 'package:mega/app/features/chat/domain/entities/chat_list_user_entity.dart';
import 'package:mega/app/features/chat/domain/entities/last_message_entity.dart';

class ChatListEntity {
  final String id;
  final List<ChatListUserEntity> participants;
  final DateTime createdAt;
  final DateTime updatedAt;
  final LastMessageEntity? lastMessage;

  const ChatListEntity({
    required this.id,
    required this.participants,
    required this.createdAt,
    required this.updatedAt,
    this.lastMessage,
  });
}
