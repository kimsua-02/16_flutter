
import 'package:flutter/material.dart';

import '../widgets/delete_widget.dart';
import '../widgets/insert_widget.dart';
import '../widgets/update_widget.dart';
import 'main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  // 탭에 따라 표시할 화면들
  final List<Widget> _pages = [
    MainScreen(),
    Center(child: Text("조회화면", style: TextStyle(fontSize: 30),),),
    MenuInsertWidget(),
    MenuUpdateWidget(),
    MenuDeleteWidget(),
  ];

  // 탭 선택 시 호출 함수
  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Restaurant"),
        backgroundColor: Colors.black,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "홈"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "메뉴조회"),
          BottomNavigationBarItem(icon: Icon(Icons.insert_chart),label: "메뉴등록"),
          BottomNavigationBarItem(icon: Icon(Icons.update),label: "메뉴수정"),
          BottomNavigationBarItem(icon: Icon(Icons.delete),label: "메뉴삭제"),
        ],
      ),

    );
  }
}
