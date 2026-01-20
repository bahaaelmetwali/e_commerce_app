import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/core/errors/failure.dart';
import 'package:mega/app/features/menu/domain/repos/static_repo.dart';

@singleton
class RateAppUseCase {
  final StaticRepo repo;
  RateAppUseCase(this.repo);
  Future<Either<Failure, Unit>> call(RateAppParams params) async {
    return await repo.rateApp(params);
  }
}

class RateAppParams {
  final double rating;
  final String? comment;
  RateAppParams({required this.rating, this.comment});
  Map<String, dynamic> toMap() {
    return {'rate': rating, 'comment': comment};
  }
}
