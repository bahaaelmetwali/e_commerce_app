import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/core/data/domain/repos/auth_state_repository.dart';
import 'package:mega/app/core/data/domain/repos/cached_authenticated_repository.dart';
import 'package:mega/app/core/errors/failure.dart';

import '../../../../core/data/domain/entities/token_entity.dart';
import '../../../../core/utils/request_handler.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../data_source/auth_remote_data_source.dart';
import '../model/forget_password_model.dart';
import '../model/login_request_model.dart';
import '../model/otp_request_model.dart';
import '../model/register_request_model.dart';
import '../model/reset_password_model.dart';
import '../model/verify_pass_code_model.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final CachedAuthenticatedRepository cachedAuthenticatedRepository;
  final AuthStateRepository authStateRepository;
  AuthRepoImpl(
    this.authRemoteDataSource, {
    required this.cachedAuthenticatedRepository, required this.authStateRepository,
  });
  //done
  @override
  Future<Either<Failure, AuthEntity>> register(
    RegisterRequestModel registerRequest,
  ) {
    return requestHandler(
      request: () async {
        final response = await authRemoteDataSource.register(registerRequest);
        final tokenEntity = TokenEntity(token: response.token);
        await cachedAuthenticatedRepository.saveToken(tokenEntity);
        return response;
      },
    );
  }

  @override
  Future<Either<Failure, AuthEntity>> login(LoginRequestModel loginRequest) {
    return requestHandler(
      request: () async {
        final response = await authRemoteDataSource.login(loginRequest);
        final tokenEntity = TokenEntity(token: response.token);

        final userEntity = response.toUserEntity();
        await cachedAuthenticatedRepository.saveToken(tokenEntity);
        await cachedAuthenticatedRepository.saveUserInfo(userEntity);
        await authStateRepository.setAuthMode();
        return response;
      },
    );
  }

  // Done
  @override
  Future<Either<Failure, Unit>> verifyEmail(OtpRequestModel otpRequest) {
    return requestHandler(
      request: () async {
        await authRemoteDataSource.verifyEmail(otpRequest);

        return Future.value(unit);
      },
    );
  }

  //done
  @override
  Future<Either<Failure, Unit>> resendVerificationCode() {
    return requestHandler(
      request: () async {
        await authRemoteDataSource.resendVerificationCode();
        return Future.value(unit);
      },
    );
  }

  //done
  @override
  Future<Either<Failure, Unit>> forgetPassword(
    ForgetPasswordModel forgetPasswordModel,
  ) {
    return requestHandler(
      request: () async {
        final response = await authRemoteDataSource.forgetPassword(
          forgetPasswordModel,
        );
        final tokenEntity = TokenEntity(token: response.token);

        await cachedAuthenticatedRepository.saveToken(tokenEntity);

        return Future.value(unit);
      },
    );
  }

  //done
  @override
  Future<Either<Failure, Unit>> verifyPassCode(
    VerifyPassCodeModel verifyPassCodeModel,
  ) {
    return requestHandler(
      request: () async {
        await authRemoteDataSource.verifyPassCode(verifyPassCodeModel);
        return Future.value(unit);
      },
    );
  }

  //done
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

  //done
  @override
  Future<Either<Failure, Unit>> loginAsGuest() {
    return requestHandler(
      requiresNetwork: false,
      request: () async {
        await cachedAuthenticatedRepository.clearToken();
        await cachedAuthenticatedRepository.clearUserInfo();
        await authStateRepository.setGuestMode();
        return Future.value(unit);
      },
    );
  }

  //done
  @override
  Future<Either<Failure, Unit>> logout() {
    return requestHandler(
      requiresNetwork: false,
      request: () async {
        await cachedAuthenticatedRepository.clearToken();
        await authStateRepository.clearAuthMode();
        await cachedAuthenticatedRepository.clearUserInfo();
        return Future.value(unit);
      },
    );
  }

  //done
  @override
  Future<Either<Failure, Unit>> resendResetPassCode() {
    return requestHandler(
      request: () async {
        final response = await authRemoteDataSource.resendPassCode();
        return response;
      },
    );
  }
}
