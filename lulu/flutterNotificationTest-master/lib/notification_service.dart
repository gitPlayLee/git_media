import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  NotificationService() {
    init();
  }

  void init() async {
    tz.initializeTimeZones();
    notificationsPlugin = FlutterLocalNotificationsPlugin();
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    final InitializationSettings initializationSettings =
        InitializationSettings(iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  Future selectNotification(String payload) async {
    print('Payload: $payload');
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    print(title);
  }

  FlutterLocalNotificationsPlugin notificationsPlugin;

  Future<void> scheduleNotification() async {
    int randomID = Random().nextInt(10);

    tz.TZDateTime scheduledDate =
        tz.TZDateTime.now(tz.local).add(Duration(seconds: 5));
    NotificationDetails notificationDetails = NotificationDetails(
        iOS: IOSNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
            badgeNumber: randomID));

    await notificationsPlugin.zonedSchedule(
        randomID, 'test', 'body', scheduledDate, notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
    print('notification scheduled');
  }

  void getCurrentNotifications() async {
    print('getting notifications');

    final List<PendingNotificationRequest> pendingNotificationRequests =
        await notificationsPlugin.pendingNotificationRequests();

    for (var notification in pendingNotificationRequests) {
      print(notification.id);
    }
  }
}
