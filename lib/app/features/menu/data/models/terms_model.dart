import '../../domain/entities/terms_entity.dart';

class TermsModel {
  final String content;
  TermsModel({required this.content});

  factory TermsModel.fromJson(Map<String, dynamic> json) {
    return TermsModel(
      content: json['content'],
    );
  }


  TermsEntity toEntity() {
    return TermsEntity(content: content);
  }
}
