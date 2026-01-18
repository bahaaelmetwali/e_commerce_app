import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../repos/auth_repo.dart';

@singleton
class GetAuthModeUseCase {
  final AuthRepo repo;

  GetAuthModeUseCase(this.repo);

  Future<Either<Failure, String?>> call() {
    return repo.getAuthMode();
  }
}
