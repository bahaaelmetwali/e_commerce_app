import 'package:mega/app/core/config/router/route_names.dart';
import 'package:mega/constants/assets.dart';

import '../../../../../main.dart';

class NotificationEntity {
  final String id;
  final String userId;
  final String title;
  final String message;
  final NotificationTypeEnum type;
  final Map<String, dynamic> data;
  final bool isRead;
  final DateTime createdAt;

  NotificationEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
    required this.type,
    required this.data,
    required this.isRead,
    required this.createdAt,
  });
}

enum NotificationTypeEnum {
  order('ORDER'),
  product('PRODUCT'),
  announcement('ANNOUNCEMENT'),
  reminder('REMINDER'),
  system('SYSTEM');

  final String value;
  const NotificationTypeEnum(this.value);

  factory NotificationTypeEnum.fromString(String type) {
    return NotificationTypeEnum.values.firstWhere(
      (e) => e.value == type,
      orElse: () => NotificationTypeEnum.system,
    );
  }

  String get notificationIcon {
    switch (this) {
      case NotificationTypeEnum.order:
        return Assets.iconsTrack;
      case NotificationTypeEnum.product:
        return Assets.iconsGift;
      case NotificationTypeEnum.announcement:
      case NotificationTypeEnum.reminder:
        return Assets.iconsVoucher;
      case NotificationTypeEnum.system:
        return Assets.iconsAlerts;
    }
  }

  void navigate(Map<String, dynamic> data) {
    switch (this) {
      case NotificationTypeEnum.order:
      case NotificationTypeEnum.announcement:
      case NotificationTypeEnum.reminder:
      case NotificationTypeEnum.system:
        navigatorKey.currentState?.pushNamed(RouteNames.mainLayout,
            arguments: false);
        break;

      case NotificationTypeEnum.product:
        navigatorKey.currentState?.pushNamed(
          RouteNames.productDetails,
          arguments: data['productId'],
        );
        break;
    }
  }
}
