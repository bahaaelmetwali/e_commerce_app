import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/failure.dart';
import '../entities/user_entity.dart';
import '../repos/cached_authenticated_repository.dart';

@lazySingleton
class GetUserInfoUseCase {
  GetUserInfoUseCase(this._cachedAuthenticatedRepository);

  final CachedAuthenticatedRepository _cachedAuthenticatedRepository;

  Future<Either<Failure, UserEntity?>> call() {
    return _cachedAuthenticatedRepository.getUserInfo();
  }
}
