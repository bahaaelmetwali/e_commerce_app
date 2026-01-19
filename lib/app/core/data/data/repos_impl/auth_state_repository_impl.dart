import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/failure.dart';
import '../../../utils/request_handler.dart';
import '../../domain/repos/auth_state_repository.dart';
import '../data_source/auth_state_local_data_source.dart';

@LazySingleton(as: AuthStateRepository)
class AuthStateRepositoryImpl implements AuthStateRepository {
  final AuthStateLocalDataSource localDataSource;

  AuthStateRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, Unit>> setGuestMode() {
    return requestHandler(
      request: () => localDataSource.setGuestMode(),
    );
  }

  @override
  Future<Either<Failure, Unit>> setAuthMode() {
    return requestHandler(
      request: () => localDataSource.setAuthMode(),
    );
  }

  @override
  Future<Either<Failure, String?>> getAuthMode() {
    return requestHandler(
      request: () => localDataSource.getAuthMode(),
    );
  }

  @override
  Future<Either<Failure, Unit>> clearAuthMode() {
    return requestHandler(
      request: () => localDataSource.clearAuthMode(),
    );
  }
}
