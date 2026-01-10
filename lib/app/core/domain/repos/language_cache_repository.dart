import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/app/core/domain/entities/language/app_language_code_enum.dart';
import 'package:e_commerce_app/app/core/errors/failure.dart';

abstract class LanguageCacheRepository {
  Future<Either<Failure, AppLanguageCodeEnum>> getSavedLanguage();
  Future<Either<Failure, Unit>> saveLanguage(AppLanguageCodeEnum languageCode);
}
