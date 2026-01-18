import 'package:dartz/dartz.dart';
import 'package:mega/app/features/Auth/data/model/login_request_model.dart';
import 'package:mega/app/features/Auth/data/model/otp_request_model.dart';
import 'package:mega/app/features/Auth/data/model/register_request_model.dart';
import 'package:mega/app/features/Auth/domain/entities/auth_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../data/model/forget_password_model.dart';
import '../../data/model/reset_password_model.dart';
import '../../data/model/verify_pass_code_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthEntity>> register(
    RegisterRequestModel registerRequest,
  );
  Future<Either<Failure, AuthEntity>> login(LoginRequestModel loginRequest);
  Future<Either<Failure, Unit>> verifyEmail(OtpRequestModel otpRequest);
  Future<Either<Failure, Unit>> resendVerificationCode();
  Future<Either<Failure, Unit>> forgetPassword(
    ForgetPasswordModel forgetPasswordModel,
  );
  Future<Either<Failure, Unit>> verifyPassCode(
    VerifyPassCodeModel verifyPassCodeModel,
  );
  Future<Either<Failure, Unit>> resetPassword(
    ResetPasswordModel resetPasswordModel,
  );
  Future<Either<Failure, String?>> getToken();
  Future<Either<Failure, AuthEntity>> getProfile();
  Future<Either<Failure, Unit>> loginAsGuest();
  Future<Either<Failure, String?>> getAuthMode();
  Future<Either<Failure, Unit>> logout();



}
