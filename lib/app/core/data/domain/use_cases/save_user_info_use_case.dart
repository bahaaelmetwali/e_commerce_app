import 'package:dartz/dartz.dart';

import '../../../errors/failure.dart';
import '../entities/user_entity.dart'  ;
import '../repos/cached_authenticated_repository.dart';

class SaveUserInfoUseCase {
  final CachedAuthenticatedRepository cachedAuthenticatedRepository;
  SaveUserInfoUseCase(this.cachedAuthenticatedRepository);
  Future<Either<Failure, Unit>> call(final UserEntity user) {
    return cachedAuthenticatedRepository.saveUserInfo(user);
  }
}
