import 'package:dartz/dartz.dart';
import 'package:mega/app/core/data/domain/entities/language/app_language_code_enum.dart';
import 'package:mega/app/core/errors/failure.dart';

abstract class LanguageCacheRepository {
  Future<Either<Failure, AppLanguageCodeEnum>> getSavedLanguage();
  Future<Either<Failure, Unit>> saveLanguage(AppLanguageCodeEnum languageCode);
}
