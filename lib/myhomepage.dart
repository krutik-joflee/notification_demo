import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> _shownotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails("your channel id", "your channel name",
            channelDescription: "your channel description",
            importance: Importance.max,
            priority: Priority.high,
            ticker: "ticker");
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, 'Krutik', 'I Am Krutik', platformChannelSpecifics,
        payload: 'item x');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LOCAL NOTIFICATION"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              _shownotification();
            },
            child: const Icon(Icons.notifications_active)),
      ),
    );
  }
}
