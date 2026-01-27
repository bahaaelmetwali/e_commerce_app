import 'package:mega/app/features/chat/domain/entities/chat_message_entity.dart';
import 'package:mega/app/features/chat/domain/entities/chat_user_entity.dart';

class ChatDetailEntity {
  final String chatId;
  final ChatUserEntity currentUser;
  final ChatUserEntity otherUser;
  final List<ChatMessageEntity> messages;

  const ChatDetailEntity({
    required this.chatId,
    required this.currentUser,
    required this.otherUser,
    required this.messages,
  });
}
