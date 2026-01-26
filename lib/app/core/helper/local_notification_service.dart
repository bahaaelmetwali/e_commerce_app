import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class LocalNotifications {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  //init_local_notifications
  static Future<void> init() async {
    InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings('@drawable/ic_logo'),
      iOS: DarwinInitializationSettings(),
    );

    await flutterLocalNotificationsPlugin.initialize(
      settings: settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  static void onTap(NotificationResponse details) {
    //handle notification tapped logic here
  }
  //notification details
  static NotificationDetails notificationDetails = const NotificationDetails(
    android: AndroidNotificationDetails(
      'id:0',
      'NoteDetails',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
    ),
    iOS: DarwinNotificationDetails(),
  );
  //single notifications
  static Future<void> showSBasicNotifications({RemoteMessage? message}) async {
    await flutterLocalNotificationsPlugin.show(
      id: 0,
      title: message?.notification?.title,
      body: message?.notification?.body,
      notificationDetails: notificationDetails,
      payload: 'SingleNotifcation',
    );
  }

  //cancelNotification
  static Future<void> cancelNotifications(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id: id);
  }

  //cancelAllNotification
  static Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
