import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:mega/app/core/errors/failure.dart';
import 'package:mega/app/core/utils/request_handler.dart';
import 'package:mega/app/features/notification/data/data_source/notification_data_source.dart';

import 'package:mega/app/features/notification/domain/entities/notification_entity.dart';

import '../../domain/repo/notification_repo.dart';

@Injectable(as: NotificationRepo)
class NotificationRepoImpl extends NotificationRepo {
  final NotificationDataSource notificationDataSource;
  NotificationRepoImpl({required this.notificationDataSource});
  @override
  Future<Either<Failure, List<NotificationEntity>>>
  getAllNotifications() async {
    return requestHandler(
      request: () async {
        final notifications = await notificationDataSource
            .fetchAllNotifications();
        List<NotificationEntity> notificationEntities = notifications
            .map((notificationModel) => notificationModel.toEntity())
            .toList();
        return notificationEntities;
      },
    );
  }
}
