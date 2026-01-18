import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/domain/repos/auth_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../data/model/forget_password_model.dart';
@singleton
class ForgetPasswordUseCase {
  final AuthRepo authRepo;
  ForgetPasswordUseCase(this.authRepo);
  Future<Either<Failure, Unit>> call(ForgetPasswordModel forgetPasswordModel) {
    return authRepo.forgetPassword(forgetPasswordModel);
  }
}
