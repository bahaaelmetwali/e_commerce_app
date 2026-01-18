import 'package:injectable/injectable.dart';

import '../../data/model/login_request_model.dart';
import '../repos/auth_repo.dart';
@singleton
class LoginUseCase {
  final AuthRepo authRepo;
  const LoginUseCase(this.authRepo);
Future call(LoginRequestModel loginRequest) {
    return authRepo.login(loginRequest);
  }
}
