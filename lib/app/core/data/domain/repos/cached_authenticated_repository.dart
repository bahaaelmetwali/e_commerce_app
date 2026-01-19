import 'package:dartz/dartz.dart';
import 'package:mega/app/core/errors/failure.dart';

import '../entities/token_entity.dart';
import '../entities/cached_user_entity.dart';

abstract class CachedAuthenticatedRepository {
  Future<Either<Failure, Unit>> saveToken(TokenEntity token);
  Future<Either<Failure, TokenEntity?>> getToken();
  Future<Either<Failure, Unit>> clearToken();
  Future<Either<Failure, Unit>> saveUserInfo(CachedUserEntity user);
  Future<Either<Failure, CachedUserEntity?>> getUserInfo();
  Future<Either<Failure, Unit>> clearUserInfo();
}
