class ResetPasswordModel {
  final String password;
  final String confirmPassword;
  ResetPasswordModel({
    required this.password,
    required this.confirmPassword,
  });
  Map<String, dynamic> toJson() {
    return {

      'newPassword': password,
      'confirmPassword': confirmPassword,
    };
  }
}

