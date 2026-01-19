import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/failure.dart';
import '../entities/cached_user_entity.dart';
import '../repos/cached_authenticated_repository.dart';

@singleton
class SaveUserInfoUseCase {
  final CachedAuthenticatedRepository cachedAuthenticatedRepository;
  SaveUserInfoUseCase(this.cachedAuthenticatedRepository);
  Future<Either<Failure, Unit>> call(final CachedUserEntity user) {
    return cachedAuthenticatedRepository.saveUserInfo(user);
  }
}
