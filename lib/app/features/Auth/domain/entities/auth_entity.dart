import 'package:mega/app/core/data/domain/entities/cached_user_entity.dart';

 class AuthEntity {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String token;
  final bool isVerified;
  final String role;
  AuthEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.token,
    required this.isVerified,
    required this.role,
  });
}

extension AuthEntityExtension on AuthEntity {
  CachedUserEntity toUserEntity() {
    return CachedUserEntity(
      id: id,
      name: name,
      email: email,
      avatar: avatar.isNotEmpty ? avatar : null,
      role: role,
    );
  }
}
