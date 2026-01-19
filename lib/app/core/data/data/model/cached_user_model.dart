
import 'dart:convert';

import '../../domain/entities/cached_user_entity.dart';

class CachedUserModel extends CachedUserEntity {
  CachedUserModel({
    required super.id,
    required super.name,
    required super.email,  super.avatar,
  });

  factory CachedUserModel.fromMap(Map<String, dynamic> map) {
    return CachedUserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      avatar: map['avatar'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
factory CachedUserModel.fromEntity(CachedUserEntity entity) {
    return CachedUserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
    );
  }
  factory CachedUserModel.fromJson(String source) =>
      CachedUserModel.fromMap(jsonDecode(source));

  String toJson() => jsonEncode(toMap());
}