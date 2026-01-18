import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/domain/repos/auth_repo.dart';

import '../../../../core/errors/failure.dart';

@singleton
class GetTokenUseCase {
  final AuthRepo authRepository;

  GetTokenUseCase(this.authRepository);

  Future<Either<Failure, String?>> call() {
    return authRepository.getToken();
  }
}
