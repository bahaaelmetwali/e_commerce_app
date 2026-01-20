import 'package:dartz/dartz.dart';
import 'package:mega/app/core/errors/failure.dart';

import '../entities/about_app_entity.dart';
import '../entities/privacy_entity.dart';
import '../entities/terms_entity.dart';
import '../use_cases/rate_app_use_case.dart';

abstract class StaticRepo {
  Future<Either<Failure, AboutAppEntity>> getAboutApp();
  Future<Either<Failure, TermsEntity>> getTermsAndConditions();
  Future<Either<Failure, PrivacyEntity>> getPrivacyPolicy();
  Future<Either<Failure, Unit>> rateApp(RateAppParams params);
}
