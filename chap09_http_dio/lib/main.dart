
/*
* Http
*  - Http 요청을 보내기 위해 사용하는 패키지
*  - 서버와 통실할 때 GET, POST, PUT, DELETE 등 http 메소드를
* 사용하여 데이터를 주고 받을 수 있게 해준다.
*
* http 패키지를 사용하는 이유
*  - 네트워크 요청관리 : 서버와 클라이언트 간 통신을 간편하게 처리할 수 있다.
*  - 비동기 작업 지원 : 비동기적으로 요청을 처리하여 UI가 멈추기 않도록 한다./
*  - RestFul API 와의 통합을 쉽게 처리할 수 있다.
*
* DIO
*  - 실제적으로 많이 사용하는 http 통신
*  - http 요청을 처리하기 위한 강력하고, 유연한 라이브러리이다.
*  - http 패키지와 비슷한 역할을 하지만, 더 많은 기능과 편의성을 제공한다.
*  - json 데이터를 dart 객체로 자동 전환하거나,
*    dart 객체를 json 으로 자동 변환할 수 있다.
*  - 인증 토큰 추가, 공통 헤더 설정 등에 유용하고,
*    멀티파트 파일 업로드만 파일 다운로드를 간단하게 처리할 수 있다.
* */

/*
* widgets - 재사용 가능한 작은 단위를 모아두는 곳
* */

import 'package:chap09_http_dio/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
