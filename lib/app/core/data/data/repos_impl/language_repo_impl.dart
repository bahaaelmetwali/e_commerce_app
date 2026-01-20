import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../errors/failure.dart';
import '../../../utils/request_handler.dart';
import '../../domain/entities/language/app_language_code_enum.dart';
import '../../domain/repos/language_cache_repository.dart';
import '../data_source/language_local_data_source.dart';

@Singleton(as: LanguageCacheRepository)
class LanguageCacheRepositoryImp implements LanguageCacheRepository {
  LanguageLocalDataSource localDataSource;
  LanguageCacheRepositoryImp(this.localDataSource);
  @override
  Future<Either<Failure, AppLanguageCodeEnum>> getSavedLanguage() async {
    return requestHandler(
      requiresNetwork: false,
      request: () {
        return localDataSource.getSavedLanguage();
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> saveLanguage(
    AppLanguageCodeEnum languageCode,
  ) async {
    return requestHandler(
      requiresNetwork: false,
      request: () {
        return localDataSource.saveLanguage(languageCode);
      },
    );
  }
}
