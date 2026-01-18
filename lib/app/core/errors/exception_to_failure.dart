import 'package:dio/dio.dart';
import 'package:mega/app/core/errors/exceptions.dart';

import 'failure.dart';

Failure exceptionToFailure(Object error) {
  if (error is CacheException) {
    return CacheFailure();
  }

  if (error is NetworkException) {
    return NetworkFailure();
  }

  if (error is UnauthorizedException) {
    return ServiceFailure('Unauthorized. Please login again.');
  }

  if (error is DioException) {
    return ServiceFailure.fromDio(error);
  }

  return UnexpectedFailure(error.toString());
}
