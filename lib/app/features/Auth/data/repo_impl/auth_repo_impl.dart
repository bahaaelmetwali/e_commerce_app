import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/core/data/data/model/cached_user_model.dart';
import 'package:mega/app/core/data/data/model/token_model.dart';
import '../../../../core/data/data/data_source/auth_state_local_data_source.dart';
import '../../../../core/data/data/data_source/cached_authenticated_data_source.dart';
import '../../../../core/data/domain/entities/token_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/request_handler.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../../domain/use_cases/change_password_use_case.dart';
import '../../domain/use_cases/forget_password_use_case.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../../domain/use_cases/register_use_case.dart';
import '../../domain/use_cases/reset_password_use_case.dart';
import '../../domain/use_cases/update_email_use_case.dart';
import '../../domain/use_cases/update_profile_use_case.dart';
import '../../domain/use_cases/verify_email_update_use_case.dart';
import '../../domain/use_cases/verify_email_use_case.dart';
import '../../domain/use_cases/verify_pass_code_use_case.dart';
import '../data_source/auth_remote_data_source.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final CachedAuthenticatedDataSource cachedAuthenticatedDataSource;
  final AuthStateLocalDataSource authStateLocalDataSource;

  AuthRepoImpl({
    required this.authRemoteDataSource,
    required this.authStateLocalDataSource,
    required this.cachedAuthenticatedDataSource,
  });

  @override
  Future<Either<Failure, AuthEntity>> register(RegisterParams params) {
    return requestHandler(
      request: () async {
        final response = await authRemoteDataSource.register(params);
        final tokenEntity = TokenEntity(token: response.token);
        await cachedAuthenticatedDataSource.saveToken(
          TokenModel.fromEntity(tokenEntity),
        );
        return response;
      },
    );
  }

  @override
  Future<Either<Failure, AuthEntity>> login(LoginParams params) {
    return requestHandler(
      request: () async {
        final response = await authRemoteDataSource.login(params);
        final tokenEntity = TokenEntity(token: response.token);
        final userEntity = response.toUserEntity();
        await cachedAuthenticatedDataSource.saveToken(
          TokenModel.fromEntity(tokenEntity),
        );
        await cachedAuthenticatedDataSource.saveUserInfo(
          CachedUserModel.fromEntity(userEntity),
        );
        await authStateLocalDataSource.setAuthMode();
        return response;
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> verifyEmail(
    VerifyEmailOtpRequestParams params,
  ) {
    return requestHandler(
      request: () async {
        await authRemoteDataSource.verifyEmail(params);
        return Future.value(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> resendVerificationCode() {
    return requestHandler(
      request: () async {
        await authRemoteDataSource.resendVerificationCode();
        return Future.value(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> forgetPassword(ForgetPasswordParams params) {
    return requestHandler(
      request: () async {
        await authRemoteDataSource.forgetPassword(params);
        return Future.value(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> verifyPassCode(VerifyPassCodeParams params) {
    return requestHandler(
      request: () async {
        await authRemoteDataSource.verifyPassCode(params);
        return Future.value(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> resetPassword(ResetPasswordParams params) {
    return requestHandler(
      request: () async {
        await authRemoteDataSource.resetPassword(params);
        return Future.value(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> resendResetPassCode() {
    return requestHandler(
      request: () async {
        await authRemoteDataSource.resendResetPassCode();
        return Future.value(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> loginAsGuest() {
    return requestHandler(
      requiresNetwork: false,
      request: () async {
        await cachedAuthenticatedDataSource.clearToken();
        await cachedAuthenticatedDataSource.clearUserInfo();
        await authStateLocalDataSource.setGuestMode();
        return Future.value(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> logout() {
    return requestHandler(
      requiresNetwork: false,
      request: () async {
        await cachedAuthenticatedDataSource.clearToken();
        await cachedAuthenticatedDataSource.clearUserInfo();
        await authStateLocalDataSource.clearAuthMode();
        return Future.value(unit);
      },
    );
  }

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() {
    return requestHandler(
      request: () async {
        final response = await authRemoteDataSource.getProfile();
        return response.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateProfile(
    UpdateUserProfileParams params,
  ) {
    return requestHandler(
      request: () async {
        final response = await authRemoteDataSource.updateProfile(params);
        return response.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> changePassword(ChangePasswordParams params) {
    return requestHandler(
      request: () async {
        await authRemoteDataSource.changePassword(params);
        return Future.value(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> updateEmail(UpdateEmailParams params) {
    return requestHandler(
      request: () async {
        await authRemoteDataSource.updateEmail(params);
        return Future.value(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> resendEmailUpdate() {
    return requestHandler(
      request: () async {
        await authRemoteDataSource.resendEmailUpdate();
        return Future.value(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> verifyEmailUpdated(OtpRequestParams params) {
    return requestHandler(
      request: () async {
        await authRemoteDataSource.verifyEmailUpdated(params);
        return Future.value(unit);
      },
    );
  }
}
