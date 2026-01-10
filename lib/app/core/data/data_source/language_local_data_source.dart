import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/language/app_language_code_enum.dart';
import '../../helper/cache_helper.dart';

abstract class LanguageLocalDataSource {
  Future<Unit> saveLanguage(AppLanguageCodeEnum languageCode);
  Future<AppLanguageCodeEnum> getSavedLanguage();
}

@Singleton(as: LanguageLocalDataSource)
class LanguageLocalDataSourceImpl implements LanguageLocalDataSource {
  final CacheHelper cacheHelper;
  LanguageLocalDataSourceImpl(this.cacheHelper);

  @override
  Future<AppLanguageCodeEnum> getSavedLanguage() async {
    final codeLanguage = cacheHelper.getString('language_code');
    if (codeLanguage != null) {
      return AppLanguageCodeEnum.fromCode(codeLanguage);
    } else {
      return getDeviceLanguage;
    }
  }

  @override
  Future<Unit> saveLanguage(AppLanguageCodeEnum languageCode) async {
    final code = languageCode.code;
    await cacheHelper.saveString('language_code', code);
    return unit;
    }
}

AppLanguageCodeEnum get getDeviceLanguage {
  final deviceLanguage = WidgetsBinding.instance.platformDispatcher.locale;
  return AppLanguageCodeEnum.fromCode(deviceLanguage.languageCode);
}

@override
Future<void> saveLanguage() {
  throw UnimplementedError();
}
