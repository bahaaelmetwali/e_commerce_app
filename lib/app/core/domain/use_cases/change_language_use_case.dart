import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../errors/failure.dart';
import '../entities/language/app_language_code_enum.dart';
import '../repos/language_cache_repository.dart';

@lazySingleton
class SaveLanguageUseCase {
  final LanguageCacheRepository repository;

  SaveLanguageUseCase(this.repository);

  Future<Either<Failure, Unit>> call(AppLanguageCodeEnum languageCode) async {
    return await repository.saveLanguage(languageCode);
  }
}
