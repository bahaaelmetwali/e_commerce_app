import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/domain/repos/auth_repo.dart';

import '../../../../core/errors/failure.dart';

@singleton
class ResetPasswordUseCase {
  final AuthRepo authRepo;
  ResetPasswordUseCase(this.authRepo);
  Future<Either<Failure, Unit>> call(ResetPasswordParams resetPasswordParams) {
    return authRepo.resetPassword(resetPasswordParams);
  }
}

class ResetPasswordParams {
  final String password;
  final String confirmPassword;

  ResetPasswordParams({required this.password, required this.confirmPassword});
  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'confirm_password': confirmPassword,
    };
  }
}
