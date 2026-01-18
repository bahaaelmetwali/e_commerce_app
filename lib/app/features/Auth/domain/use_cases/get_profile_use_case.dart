import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/domain/entities/auth_entity.dart';

import '../../../../core/errors/failure.dart';
import '../repos/auth_repo.dart';

@singleton
class GetProfileUseCase {
  final AuthRepo authRepo;

  GetProfileUseCase(this.authRepo);

  Future<Either<Failure, AuthEntity>> call()  {
    return  authRepo.getProfile();
  }
}
