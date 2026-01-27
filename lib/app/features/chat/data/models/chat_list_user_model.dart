import '../../domain/entities/chat_list_user_entity.dart';

class ChatListUserModel {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String role;

  ChatListUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.role,
  });

  factory ChatListUserModel.fromJson(Map<String, dynamic> json) => ChatListUserModel(
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

  ChatListUserEntity toEntity() => ChatListUserEntity(
        id: id,
        name: name,
        email: email,
        avatar: avatar,
        role: role,
      );
}
