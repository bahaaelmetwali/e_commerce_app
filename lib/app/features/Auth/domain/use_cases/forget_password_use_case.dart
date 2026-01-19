import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/domain/repos/auth_repo.dart';

import '../../../../core/errors/failure.dart';
@singleton
class ForgetPasswordUseCase {
  final AuthRepo authRepo;
  ForgetPasswordUseCase(this.authRepo);
  Future<Either<Failure, Unit>> call(ForgetPasswordParams forgetPasswordParams) {
    return authRepo.forgetPassword(forgetPasswordParams);
  }
}
class ForgetPasswordParams {
  final String email;
  ForgetPasswordParams({required this.email});
  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }
}

