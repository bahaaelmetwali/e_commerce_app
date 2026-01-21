import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure.dart';
import '../entities/profile_entity.dart';
import '../repos/auth_repo.dart';

@singleton
class UpdateProfileUseCase {
  final AuthRepo repo;

  UpdateProfileUseCase(this.repo);

  Future<Either<Failure, ProfileEntity>> call(
    UpdateUserProfileParams params,
  ) async {
    return await repo.updateProfile(params);
  }
}

class UpdateUserProfileParams {
  final String? name;
  final File? avatar;

  const UpdateUserProfileParams({this.name, this.avatar});
  Map<String, dynamic> toMap() {
    return {
      if (name != null) 'name': name,
      if (avatar != null) 'avatar': MultipartFile.fromFileSync(avatar!.path),
    };
  }

  bool get hasData => name != null || avatar != null;
}
