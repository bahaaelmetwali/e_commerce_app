
class Failure {
  final String message;
  Failure(this.message);
  @override
  String toString() => message;
}

class CacheFailure extends Failure {
CacheFailure() : super("Cache Error Occurred");
}
class NetworkFailure extends Failure {
  NetworkFailure() : super("No Internet Connection");
}