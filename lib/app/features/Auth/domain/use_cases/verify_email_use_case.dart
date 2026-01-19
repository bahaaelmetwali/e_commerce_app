import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/domain/repos/auth_repo.dart';

import '../../../../core/errors/failure.dart';

@singleton
class VerifyEmailUseCase {
  final AuthRepo authRepo;

  VerifyEmailUseCase(this.authRepo);

  Future<Either<Failure, Unit>> call(VerifyEmailOtpRequestParams params) {
    return authRepo.verifyEmail(params);
  }
}

class VerifyEmailOtpRequestParams {
  final String otp;

  VerifyEmailOtpRequestParams({required this.otp});
  Map<String, dynamic> toMap() {
    return {
      'code': otp,
    };
  }
}