import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../repos/auth_repo.dart';

@singleton
class LogoutUseCase {
  final AuthRepo authRepo;
  LogoutUseCase(this.authRepo);
  Future<Either<Failure, Unit>> call() async {
    return await authRepo.logout();
  }
}
