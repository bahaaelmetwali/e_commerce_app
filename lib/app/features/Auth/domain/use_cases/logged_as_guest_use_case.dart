import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/domain/repos/auth_repo.dart';

import '../../../../core/errors/failure.dart';

@singleton
class LoginAsGuestUseCase {
  final AuthRepo repo;

  LoginAsGuestUseCase(this.repo);

  Future<Either<Failure, Unit>> call() {
    return repo.loginAsGuest();
  }
}
