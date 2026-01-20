import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/core/errors/failure.dart';
import 'package:mega/app/features/menu/domain/repos/static_repo.dart';

import '../entities/terms_entity.dart';

@singleton
class GetTermsUseCase {
  final StaticRepo repo;
  GetTermsUseCase(this.repo);
  Future<Either<Failure, TermsEntity>> call() async {
    return await repo.getTermsAndConditions();
  }
}
