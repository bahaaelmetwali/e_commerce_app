import 'package:dartz/dartz.dart';
import 'package:mega/app/core/di/injection.dart';
import '../errors/exception_to_failure.dart';
import '../errors/failure.dart';
import '../network/check_network.dart';

Future<Either<Failure, T>> requestHandler<T>({
  required Future<T> Function() request,
  bool requiresNetwork = true,
}) async {
  try {
    final networkInfo = await getIt<CheckNetwork>().isConnected;
    if (requiresNetwork && !  networkInfo) {
      return Left(NetworkFailure());
    }

    final result = await request();
    return Right(result);
  } catch (e) {
    return Left(exceptionToFailure(e));
  }
}
