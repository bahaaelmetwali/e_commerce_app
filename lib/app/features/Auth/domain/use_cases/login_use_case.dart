import 'package:injectable/injectable.dart';

import '../repos/auth_repo.dart';

@singleton
class LoginUseCase {
  final AuthRepo authRepo;
  const LoginUseCase(this.authRepo);
  Future call(LoginParams loginParams) {
    return authRepo.login(loginParams);
  }
}

class LoginParams {
  final String email;
  final String password;
  final String fcmToken;
  LoginParams({
    required this.email,
    required this.password,
    required this.fcmToken,
  });
  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password, 'fcm_token': fcmToken};
  }
}
