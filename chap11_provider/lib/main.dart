
/*
* Provider
*  - 매우 유연하고 자유도가 높은 다양한 방식의 상태 관리 라이브러리
*  - 전역적인 상태 관리부터 특정 위젯 내부 상태 공유도 가능하다.
*  - 하지만 사요하는 방식에 따라서 구조와 성능에 많은 영향을 줄 수 있다.
*
*  - 공유할 위젯들 상위를 ChangNofifierProvider 로 감싸면 된다.
*
* 주요 개념
*  - 상태 관리 = ui 상태를 관리하고 반영하는 도구
*  - ChangeNotifier = provider 가 상태를 관리하기 위한 클래스
*  - Consumer = ChangeNotifier 에 의해 관리되는 데이터를 사용하는 위젯
*
* 상태가 변경될 때마다 자동으로 해당 데이터를 업데이트하고,
* 필요한 부분만 다시 빌드한다.
* */

import 'package:chap11_provider/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homscreen.dart';

void main (){
  runApp(
      MultiProvider(
          providers: [
      ChangeNotifierProvider( // 다 이 Store 를 사용할 수 있게 됨
      create: (context)=>Store(),
    ),
            ChangeNotifierProvider(create: (context) => Store2(),)
  ],     child: MyApp()));
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


