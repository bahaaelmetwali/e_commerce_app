import 'package:mega/app/features/chat/data/models/chat_user_model.dart';

import '../../domain/entities/chat_message_entity.dart';

class ChatMessageModel {
  final String id;
  final String chatId;
  final ChatUserModel sender;
  final String text;
  final List<String> media;
  final String status;
  final List<String> readBy;
  final DateTime createdAt;
  final bool isMine;

  ChatMessageModel({
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

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      ChatMessageModel(
        id: json['_id'],
        chatId: json['conversation'] as String? ?? '',
        sender: ChatUserModel.fromJson(json['sender']),
        text: json['text'],
        media: List<String>.from(json['media'] ?? []),
        status: json['status'],
        readBy: List<String>.from(json['readBy'] ?? []),
        createdAt: DateTime.parse(json['createdAt']),
        isMine: json['isMine'] ?? false,
      );
  factory ChatMessageModel.fromPusherJson(
    Map<String, dynamic> json,
    String currentUserId,
  ) {
    return ChatMessageModel(
      id: json['_id'] as String,
      chatId: (json['conversation']?['_id'] ?? '') as String,
      sender: ChatUserModel.fromJson(json['sender'] as Map<String, dynamic>),
      text: json['text'] as String? ?? '',
      media: (json['media'] as List<dynamic>?)?.cast<String>() ?? [],
      status: json['status'] as String? ?? 'sent',
      readBy: (json['readBy'] as List<dynamic>?)?.cast<String>() ?? [],
      createdAt:
          DateTime.tryParse(json['createdAt'] as String? ?? '') ??
          DateTime.now(),
      isMine: (json['sender']?['_id'] ?? '') != currentUserId,
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'conversation': chatId,
    'sender': sender.toJson(),
    'text': text,
    'media': media,
    'status': status,
    'readBy': readBy,
    'createdAt': createdAt.toIso8601String(),
    'isMine': isMine,
  };

  ChatMessageEntity toEntity() => ChatMessageEntity(
    id: id,
    chatId: chatId,
    sender: sender.toEntity(),
    text: text,
    media: media,
    status: _mapStatus(status),
    readBy: readBy,
    createdAt: createdAt,
    isMine: isMine,
  );

  MessageStatus _mapStatus(String status) {
    switch (status) {
      case 'sent':
        return MessageStatus.sent;
      case 'delivered':
        return MessageStatus.delivered;
      case 'seen':
        return MessageStatus.seen;
      default:
        return MessageStatus.sent;
    }
  }
}
