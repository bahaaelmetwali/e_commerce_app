import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/failure.dart';
import '../repos/auth_state_repository.dart';

@lazySingleton
class ClearAuthModeUseCase {
  final AuthStateRepository authStateRepository;
  ClearAuthModeUseCase(this.authStateRepository);

  Future<Either<Failure, Unit>> call() {
    return  authStateRepository.clearAuthMode();
  }
}