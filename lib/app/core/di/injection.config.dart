// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/Auth/data/data_source/auth_remote_data_source.dart'
    as _i114;
import '../../features/Auth/data/repo_impl/auth_repo_impl.dart' as _i304;
import '../../features/Auth/domain/repos/auth_repo.dart' as _i848;
import '../../features/Auth/domain/use_cases/forget_password_use_case.dart'
    as _i812;
import '../../features/Auth/domain/use_cases/get_auh_mode_use_case.dart'
    as _i515;
import '../../features/Auth/domain/use_cases/get_profile_use_case.dart'
    as _i1055;
import '../../features/Auth/domain/use_cases/get_token_use_case.dart' as _i323;
import '../../features/Auth/domain/use_cases/logged_as_guest_use_case.dart'
    as _i1002;
import '../../features/Auth/domain/use_cases/login_use_case.dart' as _i694;
import '../../features/Auth/domain/use_cases/register_use_case.dart' as _i228;
import '../../features/Auth/domain/use_cases/resend_verification_code_use_case.dart'
    as _i556;
import '../../features/Auth/domain/use_cases/reset_password_use_case.dart'
    as _i942;
import '../../features/Auth/domain/use_cases/verify_email_use_case.dart'
    as _i156;
import '../../features/Auth/domain/use_cases/verify_pass_code_use_case.dart'
    as _i412;
import '../../features/Auth/presentation/cubits/auth/auth_cubit.dart' as _i340;
import '../../features/Auth/presentation/cubits/forget_password/forget_password_cubit.dart'
    as _i759;
import '../../features/Auth/presentation/cubits/login/login_cubit.dart'
    as _i610;
import '../../features/Auth/presentation/cubits/register/register_cubit.dart'
    as _i478;
import '../../features/Auth/presentation/cubits/resend_code/resend_code_cubit.dart'
    as _i554;
import '../../features/Auth/presentation/cubits/reset_password/reset_password_cubit.dart'
    as _i665;
import '../../features/Auth/presentation/cubits/verify_email/verify_email_cubit.dart'
    as _i565;
import '../../features/Auth/presentation/cubits/verify_pass_code/verify_pass_code_cubit.dart'
    as _i911;
import '../data/data_source/language_local_data_source.dart' as _i395;
import '../data/data_source/local_data_source.dart' as _i386;
import '../data/repos_impl/language_repo_impl.dart' as _i786;
import '../domain/repos/language_cache_repository.dart' as _i490;
import '../domain/use_cases/change_language_use_case.dart' as _i537;
import '../domain/use_cases/get_language_use_case.dart' as _i1073;
import '../helper/api_helper.dart' as _i926;
import '../helper/dio_api_helper.dart' as _i424;
import '../helper/dio_helper.dart' as _i408;
import '../localization/cubit/language_cubit.dart' as _i866;
import '../network/check_network.dart' as _i132;
import '../network/log_out_stream.dart' as _i959;
import 'injection.dart' as _i464;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.singleton<_i959.LogOutStream>(() => _i959.LogOutStream());
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.flutterSecureStorage,
    );
    gh.factory<_i386.LocalAuthDataSource>(
      () => _i386.LocalAuthDataSourceImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.singleton<_i408.TokenInterceptor>(
      () => _i408.TokenInterceptor(gh<_i386.LocalAuthDataSource>()),
    );
    gh.factory<_i395.LanguageLocalDataSource>(
      () => _i395.LanguageLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i490.LanguageCacheRepository>(
      () =>
          _i786.LanguageCacheRepositoryImp(gh<_i395.LanguageLocalDataSource>()),
    );
    gh.singleton<_i408.ErrorInterceptor>(
      () => _i408.ErrorInterceptor(
        gh<_i386.LocalAuthDataSource>(),
        gh<_i959.LogOutStream>(),
      ),
    );
    gh.lazySingleton<_i1073.GetAppLanguageUseCase>(
      () => _i1073.GetAppLanguageUseCase(gh<_i490.LanguageCacheRepository>()),
    );
    gh.lazySingleton<_i132.CheckNetwork>(
      () => _i132.NetworkCheckerImp(gh<_i973.InternetConnectionChecker>()),
    );
    gh.lazySingleton<_i537.SaveLanguageUseCase>(
      () => _i537.SaveLanguageUseCase(gh<_i490.LanguageCacheRepository>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(
        gh<_i408.TokenInterceptor>(),
        gh<_i408.ErrorInterceptor>(),
      ),
    );
    gh.factory<_i866.LanguageCubit>(
      () => _i866.LanguageCubit(
        gh<_i1073.GetAppLanguageUseCase>(),
        changeLanguageUseCase: gh<_i537.SaveLanguageUseCase>(),
      ),
    );
    gh.singleton<_i926.ApiHelper>(() => _i424.DioApiHelper(gh<_i361.Dio>()));
    gh.factory<_i114.AuthRemoteDataSource>(
      () => _i114.AuthRemoteDataSourceImpl(gh<_i926.ApiHelper>()),
    );
    gh.factory<_i848.AuthRepo>(
      () => _i304.AuthRepoImpl(
        gh<_i386.LocalAuthDataSource>(),
        gh<_i114.AuthRemoteDataSource>(),
      ),
    );
    gh.singleton<_i812.ForgetPasswordUseCase>(
      () => _i812.ForgetPasswordUseCase(gh<_i848.AuthRepo>()),
    );
    gh.singleton<_i1055.GetProfileUseCase>(
      () => _i1055.GetProfileUseCase(gh<_i848.AuthRepo>()),
    );
    gh.singleton<_i694.LoginUseCase>(
      () => _i694.LoginUseCase(gh<_i848.AuthRepo>()),
    );
    gh.singleton<_i228.RegisterUseCase>(
      () => _i228.RegisterUseCase(gh<_i848.AuthRepo>()),
    );
    gh.singleton<_i556.ResendVerificationCodeUseCase>(
      () => _i556.ResendVerificationCodeUseCase(gh<_i848.AuthRepo>()),
    );
    gh.singleton<_i942.ResetPasswordUseCase>(
      () => _i942.ResetPasswordUseCase(gh<_i848.AuthRepo>()),
    );
    gh.singleton<_i156.VerifyEmailUseCase>(
      () => _i156.VerifyEmailUseCase(gh<_i848.AuthRepo>()),
    );
    gh.singleton<_i412.VerifyPassCodeUseCase>(
      () => _i412.VerifyPassCodeUseCase(gh<_i848.AuthRepo>()),
    );
    gh.factory<_i911.VerifyPassCodeCubit>(
      () => _i911.VerifyPassCodeCubit(gh<_i412.VerifyPassCodeUseCase>()),
    );
    gh.factory<_i554.ResendCodeCubit>(
      () => _i554.ResendCodeCubit(gh<_i556.ResendVerificationCodeUseCase>()),
    );
    gh.factory<_i478.RegisterCubit>(
      () => _i478.RegisterCubit(gh<_i228.RegisterUseCase>()),
    );
    gh.factory<_i665.ResetPasswordCubit>(
      () => _i665.ResetPasswordCubit(gh<_i942.ResetPasswordUseCase>()),
    );
    gh.singleton<_i323.GetTokenUseCase>(
      () => _i323.GetTokenUseCase(gh<_i848.AuthRepo>()),
    );
    gh.factory<_i610.LoginCubit>(
      () => _i610.LoginCubit(gh<_i694.LoginUseCase>()),
    );
    gh.factory<_i759.ForgetPasswordCubit>(
      () => _i759.ForgetPasswordCubit(gh<_i812.ForgetPasswordUseCase>()),
    );
    gh.singleton<_i515.GetAuthModeUseCase>(
      () => _i515.GetAuthModeUseCase(gh<_i848.AuthRepo>()),
    );
    gh.singleton<_i1002.LoginAsGuestUseCase>(
      () => _i1002.LoginAsGuestUseCase(gh<_i848.AuthRepo>()),
    );
    gh.factory<_i565.VerifyEmailCubit>(
      () => _i565.VerifyEmailCubit(gh<_i156.VerifyEmailUseCase>()),
    );
    gh.factory<_i340.AuthCubit>(
      () => _i340.AuthCubit(
        gh<_i515.GetAuthModeUseCase>(),
        gh<_i323.GetTokenUseCase>(),
        gh<_i1002.LoginAsGuestUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i464.RegisterModule {}
