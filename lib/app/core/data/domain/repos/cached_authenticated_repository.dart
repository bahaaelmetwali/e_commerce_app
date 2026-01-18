import 'package:dartz/dartz.dart';
import 'package:mega/app/core/errors/failure.dart';

import '../entities/token_entity.dart';
import '../entities/user_entity.dart';

abstract class CachedAuthenticatedRepository {
  Future<Either<Failure, Unit>> saveToken(TokenEntity token);
  Future<Either<Failure, TokenEntity?>> getToken();
  Future<Either<Failure, Unit>> clearToken();

  Future<Either<Failure, Unit>> setGuestMode(final String mode);
  Future<Either<Failure, Unit>> setAuthMode(final String mode);
  Future<Either<Failure, String?>> getAuthMode();
  Future<Either<Failure, Unit>> clearAuthMode();

  Future<Either<Failure, Unit>> saveUserInfo(UserEntity user);
  Future<Either<Failure, UserEntity?>> getUserInfo();
  Future<Either<Failure, Unit>> clearUserInfo();
}
