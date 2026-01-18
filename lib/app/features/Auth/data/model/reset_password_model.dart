class ResetPasswordModel {
  final String password;
  final String confirmPassword;
  final String email;
  final String code;
  ResetPasswordModel({
    required this.password,
    required this.confirmPassword,
    required this.email,
    required this.code,
  });
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'code': code,
      'newPassword': password,
      'confirmPassword': confirmPassword,
    };
  }
}

