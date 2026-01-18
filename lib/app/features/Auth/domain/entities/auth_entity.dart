import 'package:mega/app/core/data/domain/entities/user_entity.dart';

class AuthEntity {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String token;
  final bool isVerified;

  AuthEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.token,
    required this.isVerified,
  });
}

extension AuthEntityExtension on AuthEntity {UserEntity toUserEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      avatar: avatar.isNotEmpty ? avatar : null,
    );
  }
}
