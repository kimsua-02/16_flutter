// 알림 초기화 관련 설정


// 알림 플러그인 인스턴스 생성

import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin notifications = FlutterLocalNotificationsPlugin();

initNotification() async {
  // 안드로이드 초기화 설정
  var androidInitialization = AndroidInitializationSettings("app_icons");

  // ios 설정
  var iosSetting = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestCriticalPermission: true,
    requestSoundPermission: true,
  );

  // 아이콘만 바꾸고 갖다쓰면 됨
  var initializationSettings = InitializationSettings(
    android: androidInitialization,
    iOS: iosSetting
  );

  // 초기화 실행
  await notifications.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse reponse) {
      print("알림이 클릭됨 : ${reponse.payload}");
    },
  );

  // Android 알림 채녈 생성
  // 각각 알림들을 묶어주고 채널에 속해있어야 함
  var androidChannel = AndroidNotificationChannel(
    "tead_id", // 채널 id 중복되면 안됨
    "테스트 채널", // 채널 이름
    description: "알림에 대한 설명",
    importance: Importance.max, // 알림의 중요도 설정
    playSound: true, // 소리 설정
    enableVibration: true,  // 진동 설정
    vibrationPattern: Int64List.fromList([0, 1000]), // 진동 패턴
  );

  // 채널 등록
  try {
    await notifications
        .resolvePlatformSpecificImplementation
    <AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);
    print("테스트 채널 생성 완료");
  } catch (e) {
    print("테스트 채널 생성 오류 : $e");
  }
}