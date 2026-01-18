import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/failure.dart';
import '../entities/token_entity.dart';
import '../repos/cached_authenticated_repository.dart';

@lazySingleton
class SaveTokenUseCase {
  final CachedAuthenticatedRepository cachedAuthenticatedRepository;

  SaveTokenUseCase({required this.cachedAuthenticatedRepository});

  Future<Either<Failure, Unit>> call(TokenEntity token) {
    return cachedAuthenticatedRepository.saveToken(token);
  }
}
