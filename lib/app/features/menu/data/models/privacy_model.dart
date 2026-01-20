import 'package:mega/app/features/menu/domain/entities/privacy_entity.dart';

class PrivacyModel extends PrivacyEntity {
  PrivacyModel({required super.content});
  factory PrivacyModel.fromJson(Map<String, dynamic> json) {
    return PrivacyModel(content: json['content']);
  }
  PrivacyEntity toEntity() {
    return PrivacyEntity(content: content);
  }

}
