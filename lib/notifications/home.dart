import 'package:flutter/material.dart';
import 'package:selfie_seg/notifications/local_notifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications'),),
      body: Column(
         children: [
          ElevatedButton.icon(onPressed: (){
            LocalNotification.showSimpleNotification(title: "Title", body: "This is Body", payload: "payload");
          },icon: const Icon(Icons.notifications_outlined),label: const Text("Notifications"),)
         ],
      ),
    );
  }
}