import 'package:flutter/material.dart';
import 'package:selfie_seg/notifications/home.dart';
import 'package:selfie_seg/notifications/local_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotification.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage()
    );
  }
}

