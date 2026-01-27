import 'package:mega/app/features/chat/domain/entities/chat_message_entity.dart';

import '../../domain/entities/last_message_entity.dart';

class LastMessageModel {
  final String id;
  final String senderId;
  final String text;
  final List<String> media;
  final String status;
  final DateTime createdAt;
  final bool isMine;

  LastMessageModel({
    required this.id,
    required this.senderId,
    required this.text,
    required this.media,
    required this.status,
    required this.createdAt,
    required this.isMine,
  });

  factory LastMessageModel.fromJson(Map<String, dynamic> json) => LastMessageModel(
        id: json['_id'],
        senderId: json['sender'],
        text: json['text'],
        media: List<String>.from(json['media'] ?? []),
        status: json['status'],
        createdAt: DateTime.parse(json['createdAt']),
        isMine: json['isMine'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'sender': senderId,
        'text': text,
        'media': media,
        'status': status,
        'createdAt': createdAt.toIso8601String(),
        'isMine': isMine,
      };

  LastMessageEntity toEntity() => LastMessageEntity(
        id: id,
        senderId: senderId,
        text: text,
        media: media,
        status: _mapStatus(status),
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
