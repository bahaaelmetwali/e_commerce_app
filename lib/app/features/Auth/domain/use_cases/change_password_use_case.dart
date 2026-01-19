import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure.dart';
import '../repos/auth_repo.dart';

@singleton
class ChangePasswordUseCase {
  final AuthRepo repo;

  ChangePasswordUseCase(this.repo);
  @singleton
  Future<Either<Failure, Unit>> call(ChangePasswordParams params) async {
    return await repo.changePassword(params);
  }
}

class ChangePasswordParams {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  const ChangePasswordParams({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  Map<String, dynamic> toMap() {
    return {
      'old_password': oldPassword,
      'new_password': newPassword,
      'confirm_password': confirmPassword,
    };
  }}
