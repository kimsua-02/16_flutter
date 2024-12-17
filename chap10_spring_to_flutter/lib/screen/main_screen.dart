import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Restaurant에 오신 것을 환영합니다! ",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          Text(
            "오늘의 추천 메뉴 ️",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            "1. 우럭스무디 - 8,000원\n2. 홍어빠에야 - 7,500원",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
