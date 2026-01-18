import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/domain/repos/auth_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../data/model/reset_password_model.dart';

@singleton
class ResetPasswordUseCase {
  final AuthRepo authRepo;
  ResetPasswordUseCase(this.authRepo);
  Future<Either<Failure, Unit>> call(ResetPasswordModel resetPasswordModel) {
    return authRepo.resetPassword(resetPasswordModel);
  }
}
