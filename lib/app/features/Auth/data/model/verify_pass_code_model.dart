class VerifyPassCodeModel {
  final String code;
  VerifyPassCodeModel({required this.code, });
  Map<String, dynamic> toJson() {
    return {
      'code': code,
    };
  }
}