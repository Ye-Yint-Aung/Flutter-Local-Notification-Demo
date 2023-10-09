import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService extends StatefulWidget {
  const NotificationService({super.key});

  @override
  State<NotificationService> createState() => _NotificationServiceState();
}

class _NotificationServiceState extends State<NotificationService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Local Notification"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showNotification();
          },
          child: Text("Get Notification"),
        ),
      ),
    );
  }

  showNotification() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high channel',
      'very important notification!',
      description: 'the first notification',
      importance: Importance.max,
    );
    await flutterLocalNotificationsPlugin.show(

        1,
        'my first noti',
        'a very long message',
        NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,
              channelDescription: channel.description),
        ));
  }
}
