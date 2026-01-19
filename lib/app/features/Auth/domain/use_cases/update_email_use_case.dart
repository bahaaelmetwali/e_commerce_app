import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure.dart';
import '../repos/auth_repo.dart';

@singleton
class UpdateEmailUseCase {
  final AuthRepo repo;

  UpdateEmailUseCase(this.repo);

  Future<Either<Failure, Unit>> call(UpdateEmailParams params) async {
    return await repo.updateEmail(params);
  }
}

class UpdateEmailParams {
  final String email;
  UpdateEmailParams(this.email);

  Map<String, dynamic> toMap() {
    return {'email': email};
  }}
