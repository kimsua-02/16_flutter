

import 'package:chap12_notification/notification/init_noti.dart';
import 'package:chap12_notification/screen/noti_test_screen.dart';
import 'package:flutter/material.dart';

void main() async{
  // 앱의 초기화 작업 시 필요한 메소드
  WidgetsFlutterBinding.ensureInitialized();
  await initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotiTestScreen(),
    );
  }
}
