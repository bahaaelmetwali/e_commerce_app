import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mega/app/core/helper/local_notification_service.dart';

import '../../features/notification/domain/entities/notification_entity.dart';

class PushNotificationHelper {
  PushNotificationHelper._();

  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static Future<void> init() async {
    await _requestPermission();
    _initListeners();
  }

  static Future<void> _requestPermission() async {
    await _messaging.requestPermission(alert: true, badge: true, sound: true);

    final token = await _messaging.getToken();
    log('FCM Token: $token');
  }

  static void _initListeners() {
    FirebaseMessaging.onMessage.listen(_onForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  static void _onForegroundMessage(RemoteMessage message) {
    LocalNotifications.showBasicNotification(message: message);
  }

  static Future<void> handleInitialMessage() async {
    final message = await _messaging.getInitialMessage();
    if (message != null) {
      _handleMessage(message);
    }
  }

  static void _handleMessage(RemoteMessage message) {
    final notification = mapToEntity(message.data);
    notification.type.navigate(notification.data);
  }
}



NotificationEntity mapToEntity(Map<String, dynamic> data) {
  return NotificationEntity(
    id: data['id'] ?? '',
    userId: data['userId'] ?? '',
    title: data['title'] ?? '',
    message: data['message'] ?? '',
    type: NotificationTypeEnum.fromString(data['type']),
    data: data,
    isRead: false,
    createdAt: DateTime.tryParse(data['createdAt'] ?? '') ?? DateTime.now(),
  );
}
