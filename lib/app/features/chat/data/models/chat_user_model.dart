import 'package:mega/app/features/chat/domain/entities/chat_user_entity.dart';

class ChatUserModel {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String role;

  ChatUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.role,
  });

  factory ChatUserModel.fromJson(Map<String, dynamic> json) => ChatUserModel(
        id: json['_id'] ?? json['id'],
        name: json['name'],
        email: json['email'] ?? '',
        avatar: json['avatar'] ?? '',
        role: json['role'] ?? 'user',
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'email': email,
        'avatar': avatar,
        'role': role,
      };

  ChatUserEntity toEntity() => ChatUserEntity(
        id: id,
        name: name,
        email: email,
        avatar: avatar,
        role: role,
      );
}
