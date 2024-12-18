// 특정 알림을 울리게 할 메소드

// 알림 설정
import 'package:chap13_firebase_message/notification/init_noti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

showNotification(String? title, String? content) async {
  // 안드로이드 알림 설정
  // 특정 알림 채널에 등록을 해 주어야 한다
  var androidDetails = AndroidNotificationDetails(
    "tead_id",
    "테스트 채널",
    priority: Priority.max, // 중요도와 달리 알림이 여러개 존재 시 우선순위임
    color: Colors.black,
  );

  // 애플
  var iosDetails = DarwinNotificationDetails(
    presentAlert: true, // 알림이 표시될 때 팝업을 보여줄지
    presentBadge: true, // 아이콘
    presentSound: true,
  );

  notifications.show(1,
      title
      , content
      , NotificationDetails(android: androidDetails, iOS: iosDetails),
      payload: "test_payload"
  ); // id 숫자는 고유여야 함 / 고유하지 않고 중복되면 겹치게 나타남
}

