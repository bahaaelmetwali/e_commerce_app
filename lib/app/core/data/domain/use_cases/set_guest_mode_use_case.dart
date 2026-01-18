import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/failure.dart';
import '../repos/cached_authenticated_repository.dart';

@lazySingleton
class SetGuestModeUseCase {
  final CachedAuthenticatedRepository cachedAuthenticatedRepository;
  SetGuestModeUseCase(this.cachedAuthenticatedRepository);
  Future<Either<Failure, Unit>> call(final String mode) {
    return cachedAuthenticatedRepository.setGuestMode(mode);
  }
}
