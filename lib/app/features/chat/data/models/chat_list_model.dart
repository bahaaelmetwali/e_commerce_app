import 'package:mega/app/features/chat/data/models/last_message_model.dart';
import 'package:mega/app/features/chat/domain/entities/chat_list_entity.dart';

import 'chat_list_user_model.dart';

class ChatListModel {
  final String id;
  final List<ChatListUserModel> participants;
  final DateTime createdAt;
  final DateTime updatedAt;
  final LastMessageModel? lastMessage;

  ChatListModel({
    required this.id,
    required this.participants,
    required this.createdAt,
    required this.updatedAt,
    this.lastMessage,
  });

  factory ChatListModel.fromJson(Map<String, dynamic> json) => ChatListModel(
        id: json['_id'],
        participants: List<ChatListUserModel>.from(
            (json['participants'] ?? []).map((p) => ChatListUserModel.fromJson(p))),
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        lastMessage: json['lastMessage'] != null
            ? LastMessageModel.fromJson(json['lastMessage'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'participants': participants.map((p) => p.toJson()).toList(),
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'lastMessage': lastMessage?.toJson(),
      };

  ChatListEntity toEntity() => ChatListEntity(
        id: id,
        participants: participants.map((p) => p.toEntity()).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
        lastMessage: lastMessage?.toEntity(),
      );
}
