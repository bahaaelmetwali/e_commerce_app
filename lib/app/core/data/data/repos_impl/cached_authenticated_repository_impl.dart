import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/failure.dart';
import '../../../utils/request_handler.dart';
import '../../domain/entities/token_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repos/cached_authenticated_repository.dart';
import '../data_source/cached_authenticated_data_source.dart';
import '../model/token_model.dart';
import '../model/user_model.dart';

@LazySingleton(as: CachedAuthenticatedRepository)
class CachedAuthenticatedRepositoryImpl
    implements CachedAuthenticatedRepository {
  final CachedAuthenticatedDataSource cachedAuthenticatedDataSource;

  CachedAuthenticatedRepositoryImpl({
    required this.cachedAuthenticatedDataSource,
  });

  @override
  Future<Either<Failure, Unit>> clearAuthMode() {
    return requestHandler(
      request: () async {
        return await cachedAuthenticatedDataSource.clearAuthMode();
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> clearToken() {
    return requestHandler(
      request: () async {
        return await cachedAuthenticatedDataSource.clearToken();
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> clearUserInfo() {
    return requestHandler(
      request: () async {
        return await cachedAuthenticatedDataSource.clearUserInfo();
      },
    );
  }

  @override
  Future<Either<Failure, String?>> getAuthMode() {
    return requestHandler(
      request: () async {
        return await cachedAuthenticatedDataSource.getAuthMode();
      },
    );
  }

  @override
  Future<Either<Failure, TokenEntity?>> getToken() {
    return requestHandler(
      request: () async {
        return await cachedAuthenticatedDataSource.getToken();
      },
    );
  }

  @override
  Future<Either<Failure, UserEntity?>> getUserInfo() {
    return requestHandler(
      request: () async {
        return await cachedAuthenticatedDataSource.getUserInfo();
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> saveToken(TokenEntity token) {
    return requestHandler(
      request: () async {
        final mappedToken = TokenModel.fromEntity(token);
        return await cachedAuthenticatedDataSource.saveToken(mappedToken);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> saveUserInfo(UserEntity user) {
    return requestHandler(
      request: () async {
        final mappedUser = UserModel.fromEntity(user);
        return await cachedAuthenticatedDataSource.saveUserInfo(mappedUser);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> setAuthMode() {
    return requestHandler(
      request: () async {
        return await cachedAuthenticatedDataSource.setAuthMode();
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> setGuestMode() {
    return requestHandler(
      request: () async {
        return await cachedAuthenticatedDataSource.setGuestMode();
      },
    );
  }
}
