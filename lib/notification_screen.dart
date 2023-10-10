import 'package:flutter/material.dart';
import 'package:local_notification_demo/notification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationHelper notificationHelper = NotificationHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:const Text("Local Notification"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            notificationHelper.sendNotification();
          },
          child:const Text("Get Notification"),
        ),
      ),
    );
  }
}
