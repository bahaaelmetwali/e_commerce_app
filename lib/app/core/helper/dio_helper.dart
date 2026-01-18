import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/core/data/data_source/local_data_source.dart';

import '../network/log_out_stream.dart';


@singleton
class TokenInterceptor extends Interceptor {
  final LocalAuthDataSource localAuthDataSource;
  TokenInterceptor(this.localAuthDataSource);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await localAuthDataSource.getToken();
    print("token: $token");
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}

@singleton
class ErrorInterceptor extends Interceptor {
  final LocalAuthDataSource localAuthDataSource;
  final LogOutStream logoutStream;

  ErrorInterceptor(this.localAuthDataSource, this.logoutStream);
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      localAuthDataSource.clearToken();
      logoutStream.addEvent('logout');
      handler.reject(err);
    } else {
      handler.next(err);
    }
  }
}
