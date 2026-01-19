import 'package:dartz/dartz.dart';
import '../../../errors/failure.dart';

abstract class AuthStateRepository {
  Future<Either<Failure, Unit>> setGuestMode();
  Future<Either<Failure, Unit>> setAuthMode();
  Future<Either<Failure, String?>> getAuthMode();
  Future<Either<Failure, Unit>> clearAuthMode();
}
