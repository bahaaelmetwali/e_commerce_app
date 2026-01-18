

import '../../domain/entities/token_entity.dart';

class TokenModel extends TokenEntity {
  TokenModel({required super.token});
  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(token: json['token']);
  }
    factory TokenModel.fromEntity(TokenEntity entity) {
    return TokenModel(token: entity.token);
  }


  Map<String, dynamic> toJson() => {'token': token};
}
