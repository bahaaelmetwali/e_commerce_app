import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/failure.dart';
import '../repos/cached_authenticated_repository.dart';


@lazySingleton
class SetAuthModeUseCase {
  final CachedAuthenticatedRepository cachedAuthenticatedRepository;
  SetAuthModeUseCase(this.cachedAuthenticatedRepository);
  Future<Either<Failure, Unit>> call(e) {
    return cachedAuthenticatedRepository.setAuthMode();
  }}
