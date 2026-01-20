import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/core/errors/failure.dart';
import 'package:mega/app/features/menu/domain/entities/about_app_entity.dart';
import 'package:mega/app/features/menu/domain/repos/static_repo.dart';

@singleton
class AboutAppUseCase {
  final StaticRepo repo;
  AboutAppUseCase({required this.repo});
  Future<Either<Failure, AboutAppEntity>> call() async {
    final aboutAppEntity = await repo.getAboutApp();
    return aboutAppEntity;
  }
}
