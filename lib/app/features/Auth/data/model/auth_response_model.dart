import 'package:mega/app/features/Auth/domain/entities/auth_entity.dart';

class AuthResponseModel extends AuthEntity {
  AuthResponseModel({
    required super.id,
    required super.name,
    required super.email,
    required super.avatar,
    required super.token,
    required super.isVerified,
    required super.role,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      avatar: json['avatar'] ?? '',
      token: json['token'] ?? '',
      isVerified: json['isVerified'] ?? false,
      role: json['role'] ?? '',
    );
  }
  AuthEntity toEntity() {
    return AuthEntity(
      id: id,
      name: name,
      email: email,
      avatar: avatar,
      token: token,
      isVerified: isVerified,
      role: role,
    );
  }
}