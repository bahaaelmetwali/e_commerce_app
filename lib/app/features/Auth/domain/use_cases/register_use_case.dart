import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../entities/auth_entity.dart';
import '../repos/auth_repo.dart';

@singleton
class RegisterUseCase {
  final AuthRepo authRepo;
  RegisterUseCase(this.authRepo);
  Future<Either<Failure, AuthEntity>> call(
RegisterParams  registerParams) {  {
    return authRepo.register(registerParams);
  }
}
}
class RegisterParams {
 final String name;
  final String email;
  final String password;
  final String? avatar;
  RegisterParams({
    required this.name,
    required this.email,
    required this.password,
    this.avatar,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      if (avatar != null) 'avatar': avatar,
    };
  }
}
