import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/core/errors/failure.dart';
import 'package:mega/app/core/utils/request_handler.dart';
import 'package:mega/app/features/menu/data/data_source/static_remote_data_source.dart';
import 'package:mega/app/features/menu/domain/entities/about_app_entity.dart';
import 'package:mega/app/features/menu/domain/entities/privacy_entity.dart';
import 'package:mega/app/features/menu/domain/entities/terms_entity.dart';
import 'package:mega/app/features/menu/domain/repos/static_repo.dart';
import 'package:mega/app/features/menu/domain/use_cases/rate_app_use_case.dart';

@Injectable(as: StaticRepo)
class StaticRepoImpl implements StaticRepo {
  final StaticRemoteDataSource remoteDataSource;
  StaticRepoImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, AboutAppEntity>> getAboutApp() {
    return requestHandler(
      request: () async {
        final response = await remoteDataSource.getAboutApp();
        return response.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, PrivacyEntity>> getPrivacyPolicy() {
      return requestHandler(
      request: () async {
        final response = await remoteDataSource.getPrivacyPolicy();
        return response.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, TermsEntity>> getTermsAndConditions() {
    return requestHandler(
      request: () async {
        final response = await remoteDataSource.getTermsAndConditions();
        return response.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> rateApp(RateAppParams params) {
    return requestHandler(
      request: () async {
        await remoteDataSource.rateApp(params);
        return unit;
      },
    );
  }
}
