import 'package:mega/app/core/data/domain/entities/cached_user_entity.dart';
import 'package:mega/app/core/data/domain/entities/token_entity.dart';
import 'package:mega/app/features/Auth/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.id,
    required super.name,
    required super.email,
    required super.role,
    required super.isVerified,
    required super.createdAt,
    required super.rating,
    required super.tokenVersion,
    super.avatar,
    super.fcmToken,
    super.traderRequestStatus,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return ProfileModel(
      id: data['_id'] as String,
      name: data['name'] as String,
      email: data['email'] as String,
      role: data['role'] as String,
      isVerified: data['isVerified'] as bool,
      avatar: data['avatar'] as String?,
      createdAt: DateTime.parse(data['createdAt']),
      rating: data['rating'] as int,
      tokenVersion: data['tokenVersion'] as int,
      fcmToken: data['fcmToken'] as String?,
      traderRequestStatus: data['traderRequestStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'role': role,
      'isVerified': isVerified,
      'avatar': avatar,
      'createdAt': createdAt.toIso8601String(),
      'rating': rating,
      'tokenVersion': tokenVersion,
      'fcmToken': fcmToken,
      'traderRequestStatus': traderRequestStatus,
    };
  }

  ProfileEntity toEntity() {
    return ProfileEntity(
      id: id,
      name: name,
      email: email,
      role: role,
      isVerified: isVerified,
      createdAt: createdAt,
      rating: rating,
      tokenVersion: tokenVersion,
      avatar: avatar,
      fcmToken: fcmToken,
      traderRequestStatus: traderRequestStatus,
    );
  }

  TokenEntity toTokenEntity(String token) {
    return TokenEntity(token: token);
  }

  CachedUserEntity toUserEntity() {
    return CachedUserEntity(
      id: id,
      name: name,
      email: email,
      role: role,

      avatar: avatar,
    );
  }
}
