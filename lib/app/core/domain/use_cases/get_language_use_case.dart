import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/app/core/domain/entities/language/app_language_code_enum.dart';
import 'package:e_commerce_app/app/core/domain/repos/language_cache_repository.dart';
import 'package:e_commerce_app/app/core/errors/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAppLanguageUseCase {
  GetAppLanguageUseCase(this._languageCacheRepository);
  final LanguageCacheRepository _languageCacheRepository;
  Future<Either<Failure, AppLanguageCodeEnum>> call() {
    return _languageCacheRepository.getSavedLanguage();
  }
}
