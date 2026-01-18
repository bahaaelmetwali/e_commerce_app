class LoginRequestModel {
  final String email;
  final String password;
  final String fcmToken ;
  LoginRequestModel({required this.email, required this.password, required this.fcmToken});
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'fcmToken': fcmToken,
    };
  }

}
