// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
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
import '../../features/Auth/domain/use_cases/change_password_use_case.dart'
    as _i500;
import '../../features/Auth/domain/use_cases/forget_password_use_case.dart'
    as _i812;
import '../../features/Auth/domain/use_cases/get_profile_use_case.dart'
    as _i1055;
import '../../features/Auth/domain/use_cases/logged_as_guest_use_case.dart'
    as _i1002;
import '../../features/Auth/domain/use_cases/login_use_case.dart' as _i694;
import '../../features/Auth/domain/use_cases/logout_use_case.dart' as _i1054;
import '../../features/Auth/domain/use_cases/register_use_case.dart' as _i228;
import '../../features/Auth/domain/use_cases/resend_email_update_use_case.dart'
    as _i587;
import '../../features/Auth/domain/use_cases/resend_verification_code_use_case.dart'
    as _i556;
import '../../features/Auth/domain/use_cases/reset_password_use_case.dart'
    as _i942;
import '../../features/Auth/domain/use_cases/update_email_use_case.dart'
    as _i552;
import '../../features/Auth/domain/use_cases/update_profile_use_case.dart'
    as _i611;
import '../../features/Auth/domain/use_cases/verify_email_update_use_case.dart'
    as _i598;
import '../../features/Auth/domain/use_cases/verify_email_use_case.dart'
    as _i156;
import '../../features/Auth/domain/use_cases/verify_pass_code_use_case.dart'
    as _i412;
import '../../features/Auth/presentation/cubits/auth/auth_cubit.dart' as _i340;
import '../../features/Auth/presentation/cubits/forget_password/forget_password_cubit.dart'
    as _i759;
import '../../features/Auth/presentation/cubits/log_out/logout_cubit.dart'
    as _i858;
import '../../features/Auth/presentation/cubits/login/login_cubit.dart'
    as _i610;
import '../../features/Auth/presentation/cubits/register/register_cubit.dart'
    as _i478;
import '../../features/Auth/presentation/cubits/resend_code/resend_code_cubit.dart'
    as _i554;
import '../../features/Auth/presentation/cubits/resend_email_updated/resend_email_updated_cubit.dart'
    as _i38;
import '../../features/Auth/presentation/cubits/reset_password/reset_password_cubit.dart'
    as _i665;
import '../../features/Auth/presentation/cubits/update_email/update_email_cubit.dart'
    as _i728;
import '../../features/Auth/presentation/cubits/update_password/update_password_cubit.dart'
    as _i843;
import '../../features/Auth/presentation/cubits/update_profile/update_profile_cubit.dart'
    as _i849;
import '../../features/Auth/presentation/cubits/verify_email/verify_email_cubit.dart'
    as _i565;
import '../../features/Auth/presentation/cubits/verify_email_update/verify_email_updated_cubit.dart'
    as _i962;
import '../../features/Auth/presentation/cubits/verify_pass_code/verify_pass_code_cubit.dart'
    as _i911;
import '../../features/menu/data/data_source/static_remote_data_source.dart'
    as _i816;
import '../../features/menu/data/repo_impl/static_repo_impl.dart' as _i574;
import '../../features/menu/domain/repos/static_repo.dart' as _i742;
import '../../features/menu/domain/use_cases/about_app_use_case.dart' as _i900;
import '../../features/menu/domain/use_cases/get_privacy_use_case.dart'
    as _i565;
import '../../features/menu/domain/use_cases/get_terms_use_case.dart' as _i715;
import '../../features/menu/domain/use_cases/rate_app_use_case.dart' as _i530;
import '../../features/menu/presentation/cubits/about_app/about_app_cubit.dart'
    as _i455;
import '../../features/menu/presentation/cubits/get_cached_data/get_cached_data_cubit.dart'
    as _i903;
import '../../features/menu/presentation/cubits/privacy/privacy_cubit.dart'
    as _i1069;
import '../../features/menu/presentation/cubits/rate_app/rate_app_cubit.dart'
    as _i701;
import '../../features/menu/presentation/cubits/terms/terms_cubit.dart'
    as _i240;
import '../../features/products/data/data_sources/remote_products_data_source.dart'
    as _i204;
import '../../features/products/data/repo_impl/products_repo_impl.dart'
    as _i249;
import '../../features/products/domain/repos/products_repo.dart' as _i556;
import '../../features/products/domain/use_cases/create_product_use_case.dart'
    as _i1059;
import '../../features/products/domain/use_cases/delete_product_use_case.dart'
    as _i153;
import '../../features/products/domain/use_cases/get_my_products_use_case.dart'
    as _i705;
import '../../features/products/domain/use_cases/get_product_use_case.dart'
    as _i950;
import '../../features/products/domain/use_cases/get_products_use_case.dart'
    as _i551;
import '../../features/products/domain/use_cases/update_product_use.dart'
    as _i1037;
import '../../features/products/presentation/cubits/add_product/add_product_cubit.dart'
    as _i123;
import '../../features/products/presentation/cubits/delete_product/delete_product_cubit.dart'
    as _i981;
import '../../features/products/presentation/cubits/get_my_products/get_my_products_cubit.dart'
    as _i847;
import '../../features/products/presentation/cubits/get_product/get_product_cubit.dart'
    as _i937;
import '../../features/products/presentation/cubits/get_products/get_products_cubit.dart'
    as _i408;
import '../../features/products/presentation/cubits/update_product/update_product_cubit.dart'
    as _i662;
import '../data/data/data_source/auth_state_local_data_source.dart' as _i323;
import '../data/data/data_source/cached_authenticated_data_source.dart' as _i29;
import '../data/data/data_source/language_local_data_source.dart' as _i191;
import '../data/data/repos_impl/auth_state_repository_impl.dart' as _i1038;
import '../data/data/repos_impl/cached_authenticated_repository_impl.dart'
    as _i418;
import '../data/data/repos_impl/language_repo_impl.dart' as _i761;
import '../data/domain/repos/auth_state_repository.dart' as _i691;
import '../data/domain/repos/cached_authenticated_repository.dart' as _i631;
import '../data/domain/repos/language_cache_repository.dart' as _i529;
import '../data/domain/use_cases/change_language_use_case.dart' as _i120;
import '../data/domain/use_cases/clear_auth_mode_use_case.dart' as _i500;
import '../data/domain/use_cases/clear_token_use_case.dart' as _i450;
import '../data/domain/use_cases/clear_user_info_use_case.dart' as _i882;
import '../data/domain/use_cases/get_auth_mode_use_case.dart' as _i178;
import '../data/domain/use_cases/get_language_use_case.dart' as _i390;
import '../data/domain/use_cases/get_token_use_case.dart' as _i799;
import '../data/domain/use_cases/get_user_info_use_case.dart' as _i590;
import '../data/domain/use_cases/save_token_use_case.dart' as _i871;
import '../data/domain/use_cases/save_user_info_use_case.dart' as _i1018;
import '../data/domain/use_cases/set_auth_mode_use_case.dart' as _i81;
import '../data/domain/use_cases/set_guest_mode_use_case.dart' as _i448;
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
    gh.lazySingleton<_i892.FirebaseMessaging>(
      () => registerModule.firebaseMessaging,
    );
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.flutterSecureStorage,
    );
    gh.factory<_i323.AuthStateLocalDataSource>(
      () =>
          _i323.AuthStateLocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i191.LanguageLocalDataSource>(
      () => _i191.LanguageLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i29.CachedAuthenticatedDataSource>(
      () => _i29.CachedAuthenticatedDataSourceImpl(
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.singleton<_i529.LanguageCacheRepository>(
      () =>
          _i761.LanguageCacheRepositoryImp(gh<_i191.LanguageLocalDataSource>()),
    );
    gh.lazySingleton<_i120.SaveLanguageUseCase>(
      () => _i120.SaveLanguageUseCase(gh<_i529.LanguageCacheRepository>()),
    );
    gh.lazySingleton<_i132.CheckNetwork>(
      () => _i132.NetworkCheckerImp(gh<_i973.InternetConnectionChecker>()),
    );
    gh.factory<_i631.CachedAuthenticatedRepository>(
      () => _i418.CachedAuthenticatedRepositoryImpl(
        cachedAuthenticatedDataSource: gh<_i29.CachedAuthenticatedDataSource>(),
      ),
    );
    gh.lazySingleton<_i691.AuthStateRepository>(
      () =>
          _i1038.AuthStateRepositoryImpl(gh<_i323.AuthStateLocalDataSource>()),
    );
    gh.lazySingleton<_i390.GetAppLanguageUseCase>(
      () => _i390.GetAppLanguageUseCase(gh<_i529.LanguageCacheRepository>()),
    );
    gh.lazySingleton<_i450.ClearTokenUseCase>(
      () => _i450.ClearTokenUseCase(gh<_i631.CachedAuthenticatedRepository>()),
    );
    gh.lazySingleton<_i590.GetUserInfoUseCase>(
      () => _i590.GetUserInfoUseCase(gh<_i631.CachedAuthenticatedRepository>()),
    );
    gh.lazySingleton<_i500.ClearAuthModeUseCase>(
      () => _i500.ClearAuthModeUseCase(gh<_i691.AuthStateRepository>()),
    );
    gh.lazySingleton<_i178.GetAuthModeUseCase>(
      () => _i178.GetAuthModeUseCase(gh<_i691.AuthStateRepository>()),
    );
    gh.lazySingleton<_i81.SetAuthModeUseCase>(
      () => _i81.SetAuthModeUseCase(gh<_i691.AuthStateRepository>()),
    );
    gh.lazySingleton<_i448.SetGuestModeUseCase>(
      () => _i448.SetGuestModeUseCase(gh<_i691.AuthStateRepository>()),
    );
    gh.lazySingleton<_i882.ClearUserInfoUseCase>(
      () =>
          _i882.ClearUserInfoUseCase(gh<_i631.CachedAuthenticatedRepository>()),
    );
    gh.lazySingleton<_i799.GetTokenUseCase>(
      () => _i799.GetTokenUseCase(gh<_i631.CachedAuthenticatedRepository>()),
    );
    gh.singleton<_i1018.SaveUserInfoUseCase>(
      () =>
          _i1018.SaveUserInfoUseCase(gh<_i631.CachedAuthenticatedRepository>()),
    );
    gh.factory<_i866.LanguageCubit>(
      () => _i866.LanguageCubit(
        gh<_i390.GetAppLanguageUseCase>(),
        changeLanguageUseCase: gh<_i120.SaveLanguageUseCase>(),
      ),
    );
    gh.lazySingleton<_i871.SaveTokenUseCase>(
      () => _i871.SaveTokenUseCase(
        cachedAuthenticatedRepository:
            gh<_i631.CachedAuthenticatedRepository>(),
      ),
    );
    gh.factory<_i903.GetCachedDataCubit>(
      () => _i903.GetCachedDataCubit(gh<_i590.GetUserInfoUseCase>()),
    );
    gh.singleton<_i408.TokenInterceptor>(
      () => _i408.TokenInterceptor(gh<_i799.GetTokenUseCase>()),
    );
    gh.singleton<_i408.ErrorInterceptor>(
      () => _i408.ErrorInterceptor(
        gh<_i450.ClearTokenUseCase>(),
        gh<_i959.LogOutStream>(),
      ),
    );
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(
        gh<_i408.TokenInterceptor>(),
        gh<_i408.ErrorInterceptor>(),
      ),
    );
    gh.singleton<_i926.ApiHelper>(() => _i424.DioApiHelper(gh<_i361.Dio>()));
    gh.factory<_i816.StaticRemoteDataSource>(
      () => _i816.StaticRemoteDataSourceImp(apiHelper: gh<_i926.ApiHelper>()),
    );
    gh.factory<_i204.RemoteProductsDataSource>(
      () =>
          _i204.RemoteProductsDataSourceImpl(apiHelper: gh<_i926.ApiHelper>()),
    );
    gh.factory<_i556.ProductsRepo>(
      () => _i249.ProductsRepoImpl(
        remoteDataSource: gh<_i204.RemoteProductsDataSource>(),
      ),
    );
    gh.factory<_i114.AuthRemoteDataSource>(
      () => _i114.AuthRemoteDataSourceImpl(gh<_i926.ApiHelper>()),
    );
    gh.factory<_i742.StaticRepo>(
      () => _i574.StaticRepoImpl(
        remoteDataSource: gh<_i816.StaticRemoteDataSource>(),
      ),
    );
    gh.singleton<_i1059.AddProductUseCase>(
      () => _i1059.AddProductUseCase(gh<_i556.ProductsRepo>()),
    );
    gh.singleton<_i153.DeleteProductUseCase>(
      () => _i153.DeleteProductUseCase(gh<_i556.ProductsRepo>()),
    );
    gh.singleton<_i705.GetMyProductsUseCase>(
      () => _i705.GetMyProductsUseCase(gh<_i556.ProductsRepo>()),
    );
    gh.singleton<_i950.GetProductUseCase>(
      () => _i950.GetProductUseCase(gh<_i556.ProductsRepo>()),
    );
    gh.singleton<_i551.GetProductsUseCase>(
      () => _i551.GetProductsUseCase(gh<_i556.ProductsRepo>()),
    );
    gh.singleton<_i1037.UpdateProductUse>(
      () => _i1037.UpdateProductUse(gh<_i556.ProductsRepo>()),
    );
    gh.factory<_i937.GetProductCubit>(
      () => _i937.GetProductCubit(gh<_i950.GetProductUseCase>()),
    );
    gh.factory<_i123.AddProductCubit>(
      () => _i123.AddProductCubit(gh<_i1059.AddProductUseCase>()),
    );
    gh.factory<_i662.UpdateProductCubit>(
      () => _i662.UpdateProductCubit(gh<_i1037.UpdateProductUse>()),
    );
    gh.factory<_i848.AuthRepo>(
      () => _i304.AuthRepoImpl(
        authRemoteDataSource: gh<_i114.AuthRemoteDataSource>(),
        authStateLocalDataSource: gh<_i323.AuthStateLocalDataSource>(),
        cachedAuthenticatedDataSource: gh<_i29.CachedAuthenticatedDataSource>(),
      ),
    );
    gh.singleton<_i565.GetPrivacyUseCase>(
      () => _i565.GetPrivacyUseCase(gh<_i742.StaticRepo>()),
    );
    gh.singleton<_i715.GetTermsUseCase>(
      () => _i715.GetTermsUseCase(gh<_i742.StaticRepo>()),
    );
    gh.singleton<_i530.RateAppUseCase>(
      () => _i530.RateAppUseCase(gh<_i742.StaticRepo>()),
    );
    gh.factory<_i701.RateAppCubit>(
      () => _i701.RateAppCubit(gh<_i530.RateAppUseCase>()),
    );
    gh.singleton<_i812.ForgetPasswordUseCase>(
      () => _i812.ForgetPasswordUseCase(gh<_i848.AuthRepo>()),
    );
    gh.singleton<_i694.LoginUseCase>(
      () => _i694.LoginUseCase(gh<_i848.AuthRepo>()),
    );
    gh.singleton<_i1054.LogoutUseCase>(
      () => _i1054.LogoutUseCase(gh<_i848.AuthRepo>()),
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
    gh.singleton<_i900.AboutAppUseCase>(
      () => _i900.AboutAppUseCase(repo: gh<_i742.StaticRepo>()),
    );
    gh.factory<_i847.GetMyProductsCubit>(
      () => _i847.GetMyProductsCubit(gh<_i705.GetMyProductsUseCase>()),
    );
    gh.factory<_i408.GetProductsCubit>(
      () => _i408.GetProductsCubit(gh<_i551.GetProductsUseCase>()),
    );
    gh.factory<_i240.TermsCubit>(
      () => _i240.TermsCubit(gh<_i715.GetTermsUseCase>()),
    );
    gh.factory<_i911.VerifyPassCodeCubit>(
      () => _i911.VerifyPassCodeCubit(gh<_i412.VerifyPassCodeUseCase>()),
    );
    gh.factory<_i455.AboutAppCubit>(
      () => _i455.AboutAppCubit(gh<_i900.AboutAppUseCase>()),
    );
    gh.factory<_i554.ResendCodeCubit>(
      () => _i554.ResendCodeCubit(gh<_i556.ResendVerificationCodeUseCase>()),
    );
    gh.factory<_i981.DeleteProductCubit>(
      () => _i981.DeleteProductCubit(gh<_i153.DeleteProductUseCase>()),
    );
    gh.factory<_i1069.PrivacyCubit>(
      () => _i1069.PrivacyCubit(gh<_i565.GetPrivacyUseCase>()),
    );
    gh.factory<_i610.LoginCubit>(
      () => _i610.LoginCubit(
        gh<_i694.LoginUseCase>(),
        gh<_i871.SaveTokenUseCase>(),
        gh<_i1018.SaveUserInfoUseCase>(),
      ),
    );
    gh.factory<_i665.ResetPasswordCubit>(
      () => _i665.ResetPasswordCubit(gh<_i942.ResetPasswordUseCase>()),
    );
    gh.factory<_i478.RegisterCubit>(
      () => _i478.RegisterCubit(
        gh<_i228.RegisterUseCase>(),
        gh<_i871.SaveTokenUseCase>(),
        saveUserInfoUseCase: gh<_i1018.SaveUserInfoUseCase>(),
      ),
    );
    gh.factory<_i759.ForgetPasswordCubit>(
      () => _i759.ForgetPasswordCubit(gh<_i812.ForgetPasswordUseCase>()),
    );
    gh.singleton<_i500.ChangePasswordUseCase>(
      () => _i500.ChangePasswordUseCase(gh<_i848.AuthRepo>()),
    );
    gh.singleton<_i1055.GetProfileUseCase>(
      () => _i1055.GetProfileUseCase(gh<_i848.AuthRepo>()),
    );
    gh.singleton<_i1002.LoginAsGuestUseCase>(
      () => _i1002.LoginAsGuestUseCase(gh<_i848.AuthRepo>()),
    );
    gh.singleton<_i587.ResendEmailUpdateUseCase>(
      () => _i587.ResendEmailUpdateUseCase(gh<_i848.AuthRepo>()),
    );
    gh.singleton<_i552.UpdateEmailUseCase>(
      () => _i552.UpdateEmailUseCase(gh<_i848.AuthRepo>()),
    );
    gh.singleton<_i611.UpdateProfileUseCase>(
      () => _i611.UpdateProfileUseCase(gh<_i848.AuthRepo>()),
    );
    gh.singleton<_i598.VerifyEmailUpdatedUseCase>(
      () => _i598.VerifyEmailUpdatedUseCase(gh<_i848.AuthRepo>()),
    );
    gh.factory<_i565.VerifyEmailCubit>(
      () => _i565.VerifyEmailCubit(gh<_i156.VerifyEmailUseCase>()),
    );
    gh.factory<_i962.VerifyEmailUpdatedCubit>(
      () => _i962.VerifyEmailUpdatedCubit(gh<_i156.VerifyEmailUseCase>()),
    );
    gh.factory<_i858.LogoutCubit>(
      () => _i858.LogoutCubit(gh<_i1054.LogoutUseCase>()),
    );
    gh.factory<_i728.UpdateEmailCubit>(
      () => _i728.UpdateEmailCubit(gh<_i552.UpdateEmailUseCase>()),
    );
    gh.factory<_i340.AuthCubit>(
      () => _i340.AuthCubit(
        gh<_i178.GetAuthModeUseCase>(),
        gh<_i799.GetTokenUseCase>(),
        gh<_i1002.LoginAsGuestUseCase>(),
      ),
    );
    gh.factory<_i38.ResendEmailUpdatedCubit>(
      () => _i38.ResendEmailUpdatedCubit(gh<_i587.ResendEmailUpdateUseCase>()),
    );
    gh.factory<_i849.UpdateProfileCubit>(
      () => _i849.UpdateProfileCubit(gh<_i611.UpdateProfileUseCase>()),
    );
    gh.factory<_i843.UpdatePasswordCubit>(
      () => _i843.UpdatePasswordCubit(gh<_i500.ChangePasswordUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i464.RegisterModule {}
