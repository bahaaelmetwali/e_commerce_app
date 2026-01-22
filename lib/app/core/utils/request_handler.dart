import 'package:dartz/dartz.dart';
import '../errors/exception_to_failure.dart';
import '../errors/failure.dart';

Future<Either<Failure, T>> requestHandler<T>({
  required Future<T> Function() request,
}) async {
  try {
    final result = await request();
    return Right(result);
  } catch (e) {
    return Left(exceptionToFailure(e));
  }
}
