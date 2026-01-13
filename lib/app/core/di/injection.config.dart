// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mega/app/core/data/data_source/language_local_data_source.dart'
    as _i310;
import 'package:mega/app/core/data/repo_impl/language_cache_repository_imp.dart'
    as _i34;
import 'package:mega/app/core/domain/repos/language_cache_repository.dart'
    as _i19;
import 'package:mega/app/core/domain/use_cases/change_language_use_case.dart'
    as _i477;
import 'package:mega/app/core/domain/use_cases/get_language_use_case.dart'
    as _i1030;
import 'package:mega/app/core/helper/cache_helper.dart' as _i616;
import 'package:mega/app/core/localization/cubit/language_cubit.dart' as _i270;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i616.CacheHelper>(
      () => _i616.CacheHelper(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i310.LanguageLocalDataSource>(
      () => _i310.LanguageLocalDataSourceImpl(gh<_i616.CacheHelper>()),
    );
    gh.singleton<_i19.LanguageCacheRepository>(
      () =>
          _i34.LanguageCacheRepositoryImp(gh<_i310.LanguageLocalDataSource>()),
    );
    gh.lazySingleton<_i1030.GetAppLanguageUseCase>(
      () => _i1030.GetAppLanguageUseCase(gh<_i19.LanguageCacheRepository>()),
    );
    gh.lazySingleton<_i477.ChangeLanguageUseCase>(
      () => _i477.ChangeLanguageUseCase(gh<_i19.LanguageCacheRepository>()),
    );
    gh.factory<_i270.LanguageCubit>(
      () => _i270.LanguageCubit(
        gh<_i1030.GetAppLanguageUseCase>(),
        changeLanguageUseCase: gh<_i477.ChangeLanguageUseCase>(),
      ),
    );
    return this;
  }
}
