import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/core/data/data_source/cached_authenticated_data_source.dart';

import 'package:mega/app/core/errors/failure.dart';
import 'package:mega/app/features/Auth/data/data_source/auth_remote_data_source.dart';
import 'package:mega/app/features/Auth/data/model/forget_password_model.dart';
import 'package:mega/app/features/Auth/data/model/otp_request_model.dart';

import 'package:mega/app/features/Auth/data/model/register_request_model.dart';
import 'package:mega/app/features/Auth/data/model/reset_password_model.dart';
import 'package:mega/app/features/Auth/data/model/verify_pass_code_model.dart';

import 'package:mega/app/features/Auth/domain/entities/auth_entity.dart';
import '../../../../core/utils/request_handler.dart';
import '../../domain/repos/auth_repo.dart';
import '../model/login_request_model.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, AuthEntity>> register(
    RegisterRequestModel registerRequest,
  ) {
    return requestHandler(
      request: () async {
        final response = await authRemoteDataSource.register(registerRequest);

        return response;
      },
    );
  }

  @override
  Future<Either<Failure, AuthEntity>> login(LoginRequestModel loginRequest) {
    return requestHandler(
      request: () async {
        final response = await authRemoteDataSource.login(loginRequest);
        await localAuthDataSource.saveToken(response.token);
        await localAuthDataSource.saveUserInfo(
          name: response.name,
          email: response.email,
        );
        await localAuthDataSource.setAuthMode();
        return response;
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> verifyEmail(OtpRequestModel otpRequest) {
    return requestHandler(
      request: () async {
        final response = await authRemoteDataSource.verifyEmail(otpRequest);
        return response;
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> resendVerificationCode() {
    return requestHandler(
      request: () async {
        final response = await authRemoteDataSource.resendVerificationCode();
        return response;
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> forgetPassword(
    ForgetPasswordModel forgetPasswordModel,
  ) {
    return requestHandler(
      request: () async {
        final response = await authRemoteDataSource.forgetPassword(
          forgetPasswordModel,
        );
        await localAuthDataSource.saveToken(response.token);

        return Future.value(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> verifyPassCode(
    VerifyPassCodeModel verifyPassCodeModel,
  ) {
    return requestHandler(
      request: () async {
        final response = await authRemoteDataSource.verifyPassCode(
          verifyPassCodeModel,
        );
        return response;
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> resetPassword(
    ResetPasswordModel resetPasswordModel,
  ) {
    return requestHandler(
      request: () async {
        final response = await authRemoteDataSource.resetPassWord(
          resetPasswordModel,
        );
        return response;
      },
    );
  }

  @override
  Future<Either<Failure, String?>> getToken() {
    return requestHandler(
      requiresNetwork: false,
      request: () async {
        final response = await localAuthDataSource.getToken();
        return response;
      },
    );
  }

  @override
  Future<Either<Failure, AuthEntity>> getProfile() {
    return requestHandler(
      request: () async {
        final response = await authRemoteDataSource.getProfile();
        return response;
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> loginAsGuest() {
    return requestHandler(
      requiresNetwork: false,
      request: () async {
        await localAuthDataSource.clearToken();
        await localAuthDataSource.clearUserInfo();
        await localAuthDataSource.setGuestMode();
        return unit;
      },
    );
  }

  @override
  Future<Either<Failure, String?>> getAuthMode() {
    return requestHandler(
      requiresNetwork: false,
      request: () async {
        return await localAuthDataSource.getAuthMode();
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> logout() {
    return requestHandler(
      requiresNetwork: false,
      request: () async {
        await localAuthDataSource.clearToken();
        await localAuthDataSource.clearAuthMode();
        await localAuthDataSource.clearUserInfo();
        return unit;
      },
    );
  }
}
