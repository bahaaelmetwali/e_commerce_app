import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../entities/notification_entity.dart';
import '../repo/notification_repo.dart';

@singleton
class GetAllNotificationsUseCase {
  final NotificationRepo _notificationRepo;

  GetAllNotificationsUseCase(this._notificationRepo);

  Future<Either<Failure, List<NotificationEntity>>> call() {
    return _notificationRepo.getAllNotifications();
  }
}
