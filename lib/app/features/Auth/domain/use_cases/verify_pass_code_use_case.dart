import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../../data/model/verify_pass_code_model.dart';
import '../repos/auth_repo.dart';

@singleton
class VerifyPassCodeUseCase {
  final AuthRepo authRepo;

  VerifyPassCodeUseCase(this.authRepo);

  Future<Either<Failure, Unit>> call(VerifyPassCodeModel verifyPassCodeModel) {
    return authRepo.verifyPassCode(verifyPassCodeModel);
  }
}
