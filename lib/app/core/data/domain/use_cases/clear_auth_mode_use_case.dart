import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/failure.dart';
import '../repos/cached_authenticated_repository.dart';

@lazySingleton
class ClearAuthModeUseCase {
  final CachedAuthenticatedRepository cachedAuthenticatedRepository;
  ClearAuthModeUseCase(this.cachedAuthenticatedRepository);

  Future<Either<Failure, Unit>> call() {
    return cachedAuthenticatedRepository.clearAuthMode();
  }
}