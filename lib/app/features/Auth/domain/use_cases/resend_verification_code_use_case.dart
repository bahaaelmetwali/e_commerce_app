import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart' show Failure;
import '../repos/auth_repo.dart';
@singleton
class ResendVerificationCodeUseCase {
  final AuthRepo authRepo;
  ResendVerificationCodeUseCase(this.authRepo);
  Future<Either<Failure, Unit>> call() => authRepo.resendVerificationCode();
}
