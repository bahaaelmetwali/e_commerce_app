import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/failure.dart';
import '../../../utils/request_handler.dart';
import '../../domain/entities/token_entity.dart';
import '../../domain/entities/cached_user_entity.dart';
import '../../domain/repos/cached_authenticated_repository.dart';
import '../data_source/cached_authenticated_data_source.dart';
import '../model/token_model.dart';
import '../model/cached_user_model.dart';

@Injectable(as: CachedAuthenticatedRepository)
class CachedAuthenticatedRepositoryImpl
    implements CachedAuthenticatedRepository {
  final CachedAuthenticatedDataSource cachedAuthenticatedDataSource;

  CachedAuthenticatedRepositoryImpl({
    required this.cachedAuthenticatedDataSource,
  });


  @override
  Future<Either<Failure, Unit>> clearToken() {
    return requestHandler(
      request: () => cachedAuthenticatedDataSource.clearToken(),
    );
  }

  @override
  Future<Either<Failure, Unit>> clearUserInfo() {
    return requestHandler(
      request: () => cachedAuthenticatedDataSource.clearUserInfo(),
    );
  }


  @override
  Future<Either<Failure, TokenEntity?>> getToken() {
    return requestHandler(
      request: () => cachedAuthenticatedDataSource.getToken(),
    );
  }

  @override
  Future<Either<Failure, CachedUserEntity?>> getUserInfo() {
    return requestHandler(
      request: () => cachedAuthenticatedDataSource.getUserInfo(),
    );
  }

  @override
  Future<Either<Failure, Unit>> saveToken(TokenEntity token) {
    return requestHandler(
      request: () async {
        final mappedToken = TokenModel.fromEntity(token);
        return cachedAuthenticatedDataSource.saveToken(mappedToken);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> saveUserInfo(CachedUserEntity user) {
    return requestHandler(
      request: () async {
        final mappedUser = CachedUserModel.fromEntity(user);
        return cachedAuthenticatedDataSource.saveUserInfo(mappedUser);
      },
    );
  }


}
