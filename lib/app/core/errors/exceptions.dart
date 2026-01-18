class CacheException implements Exception {
  
  final String message;
  CacheException([this.message = 'Cache error']);
}

class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = 'No internet connection']);
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException([this.message = 'Unauthorized access']);
}

class ServerException implements Exception {
  final String message;
  ServerException([this.message = 'Server error']);
}