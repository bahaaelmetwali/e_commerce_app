import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mega/app/core/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../helper/dio_helper.dart';

final getIt = GetIt.instance;
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  await getIt.init();
}

@module
abstract class RegisterModule {
  @lazySingleton
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker.instance;
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get flutterSecureStorage => FlutterSecureStorage();

  @lazySingleton
  Dio dio(
    TokenInterceptor tokenInterceptor,
    ErrorInterceptor errorInterceptor,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        validateStatus: (status) => status != null && status < 400,
        headers: {
          'Accept': 'application/json',
          'Accept-Language': 'ar',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      tokenInterceptor,
      errorInterceptor,
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
      ),
    ]);

    return dio;
  }
}
