import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../data/domain/use_cases/clear_token_use_case.dart';
import '../data/domain/use_cases/get_token_use_case.dart';
import '../network/log_out_stream.dart';

@singleton
class TokenInterceptor extends Interceptor {
  final GetTokenUseCase getTokenUseCase;
  TokenInterceptor(this.getTokenUseCase);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await getTokenUseCase();
    token.fold((failure) {}, (value) {
      final String? cachedToken = value?.token;
      if (cachedToken != null && cachedToken.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $cachedToken';
      }
    });
    handler.next(options);
  }
}

@singleton
class ErrorInterceptor extends Interceptor {
  final ClearTokenUseCase clearTokenUseCase;
  final LogOutStream logoutStream;

  ErrorInterceptor(this.clearTokenUseCase, this.logoutStream);
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      clearTokenUseCase();
      logoutStream.addEvent('logout');
      handler.reject(err);
    } else {
      handler.next(err);
    }
  }
}
