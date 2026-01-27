
import 'package:mega/app/features/chat/domain/entities/chat_message_entity.dart';

class LastMessageEntity {
  final String id;
  final String senderId;
  final String text;
  final List<String> media;
  final MessageStatus status;
  final DateTime createdAt;
  final bool isMine;

  const LastMessageEntity({
    required this.id,
    required this.senderId,
    required this.text,
    required this.media,
    required this.status,
    required this.createdAt,
    required this.isMine,
  });
}
