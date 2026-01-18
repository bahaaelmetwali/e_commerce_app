import 'package:dio/dio.dart';

class Failure {
  final String message;
  Failure(this.message);
  @override
  String toString() => message;
}

class ServiceFailure extends Failure {
  ServiceFailure(super.errorMessage);

  factory ServiceFailure.fromDio(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServiceFailure('Connection timeout with Api server');

      case DioExceptionType.sendTimeout:
        return ServiceFailure('Send timeout with Api server');

      case DioExceptionType.receiveTimeout:
        return ServiceFailure('Receive timeout with Api server');

      case DioExceptionType.badCertificate:
        return ServiceFailure(
          'Could not establish a secure connection to the server.',
        );

      case DioExceptionType.badResponse:
        return ServiceFailure.checkStatusCode(dioError);

      case DioExceptionType.cancel:
        return ServiceFailure('Request was cancelled. Please try again.');

      case DioExceptionType.connectionError:
        return ServiceFailure(
          'Could not connect to the server. Check your internet connection.',
        );

      case DioExceptionType.unknown:
        return ServiceFailure(
          'An unexpected error occurred. Please try again later.',
        );
    }
  }

  static ServiceFailure checkStatusCode(DioException dioError) {
    final statusCode = dioError.response?.statusCode;
    final data = dioError.response?.data;

    switch (statusCode) {
      case 400:
        return ServiceFailure('Bad request. Please check your input.');
      case 401:
        return ServiceFailure('Unauthorized. Please login again.');
      case 403:
        return ServiceFailure('Forbidden. You don’t have permission.');
      case 404:
        return ServiceFailure('Resource not found.');
      case 422:
        if (data is Map && data['errors'] != null) {
          final errors = data['errors'] as Map<String, dynamic>;
          final firstError = (errors.values.first as List).first.toString();
          return ServiceFailure(firstError);
        }
        return ServiceFailure(
          data['message'] ?? 'Unprocessable entity. Invalid input.',
        );
      case 500:
        return ServiceFailure('Internal server error. Try again later.');
      case 502:
        return ServiceFailure('Bad gateway. Please try again later.');
      case 503:
        return ServiceFailure('Service unavailable. Try again later.');
      default:
        return ServiceFailure(
          'The server responded with an invalid status: $statusCode',
        );
    }
  }
}

class CacheFailure extends Failure {
  CacheFailure() : super("Cache Error Occurred");
}

class NetworkFailure extends Failure {
  NetworkFailure() : super("No Internet Connection");
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure(super.message) ;
}
