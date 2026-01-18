import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/failure.dart';
import '../entities/token_entity.dart';
import '../repos/cached_authenticated_repository.dart';

@lazySingleton
class GetTokenUseCase {
  final CachedAuthenticatedRepository cachedAuthenticatedRepository;

  GetTokenUseCase(this.cachedAuthenticatedRepository);

  Future<Either<Failure, TokenEntity?>> call() {
    return cachedAuthenticatedRepository.getToken();
  }
}
