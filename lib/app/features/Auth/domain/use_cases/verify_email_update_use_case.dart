import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure.dart';
import '../repos/auth_repo.dart';

@singleton
class VerifyEmailUpdatedUseCase {
  final AuthRepo repo;

  VerifyEmailUpdatedUseCase(this.repo);

  Future<Either<Failure, Unit>> call(OtpRequestParams params) async {
    return await repo.verifyEmailUpdated(params);
  }
}

class OtpRequestParams {
  final String otp;

  OtpRequestParams({required this.otp});
    Map<String, dynamic> toMap() {
    return {
      'code': otp,
    };
      }}
