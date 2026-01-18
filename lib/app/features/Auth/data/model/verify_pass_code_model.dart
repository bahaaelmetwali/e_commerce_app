class VerifyPassCodeModel {
  final String code;
  final String email;
  VerifyPassCodeModel({required this.code, required this.email});
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'email': email,
    };
  }
}