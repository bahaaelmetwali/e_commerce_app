import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../repos/auth_repo.dart';

@singleton
class VerifyPassCodeUseCase {
  final AuthRepo authRepo;

  VerifyPassCodeUseCase(this.authRepo);

  Future<Either<Failure, Unit>> call(VerifyPassCodeParams params) async {
    return authRepo.verifyPassCode(params);
  }
}

class VerifyPassCodeParams {
  final String code;

  VerifyPassCodeParams({required this.code});
  Map<String, dynamic> toMap() {
    return {'code': code};
  }
}
