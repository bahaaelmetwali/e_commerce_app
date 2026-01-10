// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_commerce_app/app/core/data/data_source/language_local_data_source.dart'
    as _i412;
import 'package:e_commerce_app/app/core/data/repo_impl/language_cache_repository_imp.dart'
    as _i417;
import 'package:e_commerce_app/app/core/domain/repos/language_cache_repository.dart'
    as _i623;
import 'package:e_commerce_app/app/core/domain/use_cases/change_language_use_case.dart'
    as _i803;
import 'package:e_commerce_app/app/core/domain/use_cases/get_language_use_case.dart'
    as _i365;
import 'package:e_commerce_app/app/core/helper/cache_helper.dart' as _i163;
import 'package:e_commerce_app/app/core/localization/cubit/language_cubit.dart'
    as _i1055;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i163.CacheHelper>(
      () => _i163.CacheHelper(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i412.LanguageLocalDataSource>(
      () => _i412.LanguageLocalDataSourceImpl(gh<_i163.CacheHelper>()),
    );
    gh.singleton<_i623.LanguageCacheRepository>(
      () =>
          _i417.LanguageCacheRepositoryImp(gh<_i412.LanguageLocalDataSource>()),
    );
    gh.lazySingleton<_i365.GetAppLanguageUseCase>(
      () => _i365.GetAppLanguageUseCase(gh<_i623.LanguageCacheRepository>()),
    );
    gh.lazySingleton<_i803.ChangeLanguageUseCase>(
      () => _i803.ChangeLanguageUseCase(gh<_i623.LanguageCacheRepository>()),
    );
    gh.factory<_i1055.LanguageCubit>(
      () => _i1055.LanguageCubit(
        gh<_i365.GetAppLanguageUseCase>(),
        changeLanguageUseCase: gh<_i803.ChangeLanguageUseCase>(),
      ),
    );
    return this;
  }
}
