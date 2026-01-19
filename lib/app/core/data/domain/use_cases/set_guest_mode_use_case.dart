import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/core/data/domain/repos/auth_state_repository.dart';

import '../../../errors/failure.dart';

@lazySingleton
class SetGuestModeUseCase {
  final AuthStateRepository authStateRepository;
  SetGuestModeUseCase(this.authStateRepository);
  Future<Either<Failure, Unit>> call() {
    return authStateRepository.setGuestMode();
  }
}
