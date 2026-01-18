import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/failure.dart';
import '../repos/cached_authenticated_repository.dart';

@lazySingleton
class GetAuthModeUseCase {
  final CachedAuthenticatedRepository cachedAuthenticatedRepository;

  GetAuthModeUseCase(this.cachedAuthenticatedRepository);

  Future<Either<Failure, String?>> call() {
    return cachedAuthenticatedRepository.getAuthMode();
  }
}
