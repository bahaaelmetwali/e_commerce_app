import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/menu/domain/repos/static_repo.dart';

import '../../../../core/errors/failure.dart';
import '../entities/privacy_entity.dart';


@singleton
class GetPrivacyUseCase {
  final StaticRepo repo;
  GetPrivacyUseCase(this.repo);
  Future<Either<Failure, PrivacyEntity>> call() async {
    return await repo.getPrivacyPolicy();
  }
}
