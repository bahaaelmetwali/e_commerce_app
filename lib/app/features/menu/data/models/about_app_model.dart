import 'package:mega/app/features/menu/domain/entities/about_app_entity.dart';

class AboutAppModel extends AboutAppEntity {
  AboutAppModel({required super.content});
  factory AboutAppModel.fromJson(Map<String, dynamic> json) {
    return AboutAppModel(content: json['content']);
  }
  AboutAppEntity toEntity() {
    return AboutAppEntity(content: content);
  }
}
