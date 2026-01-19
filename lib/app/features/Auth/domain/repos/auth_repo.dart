import 'package:dartz/dartz.dart';

import '../../domain/entities/auth_entity.dart';
import '../../domain/entities/profile_entity.dart';
import '../../../../core/errors/failure.dart';
import '../use_cases/change_password_use_case.dart';
import '../use_cases/forget_password_use_case.dart';
import '../use_cases/login_use_case.dart';
import '../use_cases/register_use_case.dart';
import '../use_cases/reset_password_use_case.dart';
import '../use_cases/update_email_use_case.dart';
import '../use_cases/update_profile_use_case.dart';
import '../use_cases/verify_email_update_use_case.dart';
import '../use_cases/verify_email_use_case.dart';
import '../use_cases/verify_pass_code_use_case.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthEntity>> register(RegisterParams params);
  Future<Either<Failure, AuthEntity>> login(LoginParams params);
  Future<Either<Failure, Unit>> verifyEmail(VerifyEmailOtpRequestParams params);
  Future<Either<Failure, Unit>> resendVerificationCode();
  Future<Either<Failure, Unit>> forgetPassword(ForgetPasswordParams params);
  Future<Either<Failure, Unit>> verifyPassCode(VerifyPassCodeParams params);
  Future<Either<Failure, Unit>> resetPassword(ResetPasswordParams params);
  Future<Either<Failure, Unit>> resendResetPassCode();
  Future<Either<Failure, Unit>> loginAsGuest();
  Future<Either<Failure, Unit>> logout();

  Future<Either<Failure, ProfileEntity>> getProfile();
  Future<Either<Failure, ProfileEntity>> updateProfile(
    UpdateUserProfileParams params,
  );
  Future<Either<Failure, Unit>> changePassword(ChangePasswordParams params);
  Future<Either<Failure, Unit>> updateEmail(UpdateEmailParams params);
  Future<Either<Failure, Unit>> resendEmailUpdate();
  Future<Either<Failure, Unit>> verifyEmailUpdated(OtpRequestParams params);
}
