/*
* Diglog
*  - 사영자가 화면에 표시된 정보를 확인하거나 액션을 선택할 수 있도록
* 제공하는 팝업 창
*  - 모바일 앱에서 많이 사용되느 요소 중 하나로 주로 경고 메세지,
* 정보 알림, 확인 및 취소 등 간단한 상호작용 착을 제공한다.
*  - 플러터는 다양한 유향의 다이얼로그를 제공한다.
* */


import 'package:chap05_dialog/dialog/02_alert_dialog.dart';
import 'package:chap05_dialog/dialog/04_state_dialog.dart';
import 'package:flutter/material.dart';

import 'dialog/04_question.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDialog(),
    );
  }
}

class MyDialog extends StatelessWidget {
  const MyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("ToDo 리스트"),
        ),
      ),
      body: //DiglogTest(),
        //DialogTest2(),
        //DialogTest3(),
      //DialogTest4(),
      //DialogTest5(),
      questionTest(),
    );
  }
}

