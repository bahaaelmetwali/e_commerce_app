import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/data/model/register_request_model.dart';

import '../../../../core/errors/failure.dart';
import '../entities/auth_entity.dart';
import '../repos/auth_repo.dart';

@singleton
class RegisterUseCase {
  final AuthRepo authRepo;
  RegisterUseCase(this.authRepo);
  Future<Either<Failure, AuthEntity>> call(
    RegisterRequestModel registerRequest,
  ) {
    return authRepo.register(registerRequest);
  }
}
