class ForgetPasswordResponse {
  final bool success;
  final String message;
  final String token;

  ForgetPasswordResponse({
    required this.success,
    required this.message,
    required this.token,
  });

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      token: json['token'] as String,
    );
  }
}
