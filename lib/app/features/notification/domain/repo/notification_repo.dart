import 'package:dartz/dartz.dart';
import 'package:mega/app/core/errors/failure.dart';
import '../entities/notification_entity.dart';

abstract class NotificationRepo {
  Future<Either<Failure, List<NotificationEntity>>> getAllNotifications();
}
