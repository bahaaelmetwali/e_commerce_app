import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/failure.dart';
import '../repos/auth_state_repository.dart';

@lazySingleton
class GetAuthModeUseCase {
  final AuthStateRepository authStateRepository;

  GetAuthModeUseCase(this.authStateRepository);

  Future<Either<Failure, String?>> call() {
    return authStateRepository.getAuthMode();
  }
}
