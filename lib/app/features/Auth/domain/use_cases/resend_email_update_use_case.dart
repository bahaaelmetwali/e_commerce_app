import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure.dart';
import '../repos/auth_repo.dart';

@singleton
class ResendEmailUpdateUseCase {
  final AuthRepo repo;

  ResendEmailUpdateUseCase(this.repo);

  Future<Either<Failure, Unit>> call() async {
    return await repo.resendEmailUpdate();
  }
}
