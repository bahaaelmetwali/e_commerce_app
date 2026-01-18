import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/failure.dart';
import '../repos/cached_authenticated_repository.dart';

@lazySingleton
class ClearTokenUseCase {
  final CachedAuthenticatedRepository _cachedAuthenticatedRepository;

  ClearTokenUseCase(this._cachedAuthenticatedRepository);

  Future<Either<Failure, Unit>> call() {
    return _cachedAuthenticatedRepository.clearToken();
  }
}
