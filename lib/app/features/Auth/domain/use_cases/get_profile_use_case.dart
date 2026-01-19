import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure.dart';
import '../entities/profile_entity.dart';
import '../repos/auth_repo.dart';

@singleton
class GetProfileUseCase {
  final AuthRepo repo;

  GetProfileUseCase(this.repo);

  Future<Either<Failure, ProfileEntity>> call() async {
    return await repo.getProfile();
  }
}