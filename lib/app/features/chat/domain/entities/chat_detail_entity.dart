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

  ChatDetailEntity copyWith({
    String? chatId,
    ChatUserEntity? currentUser,
    ChatUserEntity? otherUser,
    List<ChatMessageEntity>? messages,
  }) {
    return ChatDetailEntity(
      chatId: chatId ?? this.chatId,
      currentUser: currentUser ?? this.currentUser,
      otherUser: otherUser ?? this.otherUser,
      messages: messages ?? this.messages,
    );
  }
}
