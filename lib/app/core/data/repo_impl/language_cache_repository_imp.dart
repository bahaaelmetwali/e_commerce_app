import 'package:dartz/dartz.dart';
import 'package:mega/app/core/data/data_source/language_local_data_source.dart';
import 'package:mega/app/core/domain/entities/language/app_language_code_enum.dart';
import 'package:mega/app/core/domain/repos/language_cache_repository.dart';
import 'package:mega/app/core/errors/failure.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: LanguageCacheRepository)
class LanguageCacheRepositoryImp implements LanguageCacheRepository {
  LanguageLocalDataSource localDataSource;
  LanguageCacheRepositoryImp(this.localDataSource);
  @override
  Future<Either<Failure, AppLanguageCodeEnum>> getSavedLanguage() async {
    try {
      final language = await localDataSource.getSavedLanguage();

      return Right(language);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> saveLanguage(AppLanguageCodeEnum languageCode) async{
    try {
     await localDataSource.saveLanguage(languageCode);
      return Right(unit);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
