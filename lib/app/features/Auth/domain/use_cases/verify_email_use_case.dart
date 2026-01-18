import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/domain/repos/auth_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../data/model/otp_request_model.dart';

@singleton
class VerifyEmailUseCase {
  final AuthRepo authRepo;

  VerifyEmailUseCase(this.authRepo);

  Future<Either<Failure, Unit>> call(OtpRequestModel otpRequest) {
    return authRepo.verifyEmail(otpRequest);
  }
}
