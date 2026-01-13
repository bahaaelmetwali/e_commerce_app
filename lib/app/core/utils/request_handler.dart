
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mega/app/core/errors/exceptions.dart';

import '../errors/failure.dart';
import '../network/check_network.dart';

class RequestHandler {
  final CheckNetwork networkInfo;

  RequestHandler(this.networkInfo);

  Future<Either<Failure, T>> execute<T>({
    required Future<T> Function() request,
    bool requiresNetwork = true,
  }) async {
    try {
      if (requiresNetwork && !await networkInfo.isConnected) {
        return Left(NetworkFailure());
      }

      final result = await request();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServiceFailure.fromDio(e));
    } on CacheEXCEPTION {
      return Left(CacheFailure());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
