import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mega/app/core/helper/local_notification_service.dart';

class PushNotificationHelper {
  PushNotificationHelper._();
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static Future<void> requestPermission() async {
    await messaging.requestPermission(alert: true, badge: true, sound: true);

    final token = await messaging.getToken();
    log("Firebase Messaging Token: $token");
    showForegroundNotification();
  }

  static void showForegroundNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LocalNotifications.showSBasicNotifications(message: message);
    });
  }
}
