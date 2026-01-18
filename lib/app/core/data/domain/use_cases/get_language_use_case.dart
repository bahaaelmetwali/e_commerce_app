import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../errors/failure.dart';
import '../entities/language/app_language_code_enum.dart';
import '../repos/language_cache_repository.dart';

@lazySingleton
class GetAppLanguageUseCase {
  GetAppLanguageUseCase(this._languageCacheRepository);
  final LanguageCacheRepository _languageCacheRepository;
  Future<Either<Failure, AppLanguageCodeEnum>> call() {
    return _languageCacheRepository.getSavedLanguage();
  }
}
