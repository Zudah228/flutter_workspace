import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseInAppMessagingPage extends StatefulWidget {
  const FirebaseInAppMessagingPage({super.key});

  @override
  State<FirebaseInAppMessagingPage> createState() =>
      _FirebaseInAppMessagingPageState();
}

class _FirebaseInAppMessagingPageState
    extends State<FirebaseInAppMessagingPage> {
  Future<void> _triggerEvent() async {
    try {
      print('trigger');
      await FirebaseInAppMessaging.instance.triggerEvent('テスト2');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              _triggerEvent();
            },
            child: const Text('トリガー')),
      ),
    );
  }
}
