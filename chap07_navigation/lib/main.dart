

/*
* BottomNavigationBar
*  - 하단 네비게이션 바을 구현하는데 사용된다.
* 유저가 탭을 클릭하면 onTap 이 실행되고
* 선택된 인덱스가 변경된다.
* 선택된 인덱스에 따라서 다른 위젯을 표시할 수 있다.
*
* 주요 속성
*  - currentIndex - 현재 선택된 탭의 인덱스
*  - onTap
*  - items
* */

import 'package:chap07_navigation/question.dart';
import 'package:flutter/material.dart';

import 'navi.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: //MyPage(),
      MoviePage(),
    );
  }
}



class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  // 현재 선택된 인덱스를 추적하는 변수
  int _selectedIndex = 0;

  // 선택된 페이지를 반환하는 함수
  Widget _getPage(){
    switch (_selectedIndex){
      case 0:
        return Center(child: Text("홈페이지"),);
      case 1:
        return Center(
          child: Text("스토어 페이지"),
        );
      case 2:
        return NavigationPage();
      default:
        return Center(
          child: Text("페이지 없음"),
        );
    }
  }

  // 선택된 인덱스를 변경하는 함수
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("네비게이션 테스트"),
      ),
      body: _getPage(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false, // 선택되지 않은 라벨 숨김
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            label: "홈",
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "스토어",
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.shopping_bag),
          ),
          BottomNavigationBarItem(
            label: "네비게이션",
            icon: Icon(Icons.navigation_outlined),
            activeIcon: Icon(Icons.navigation),
          )
        ],
      ),
    );
  }
}
