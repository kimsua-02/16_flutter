
import 'package:flutter/material.dart';

class Store extends ChangeNotifier {

  // 일반적인 Store 클래스의 내부 변수는 private 처리가 관례
  int _count = 0;

  int get count => _count;

  void incrementCount(){
    _count++;
    notifyListeners(); // 상태 변경 시 UI 업데이트를 위한 메소드
  }
}
class Store2 extends ChangeNotifier {

  // 일반적인 Store 클래스의 내부 변수는 private 처리가 관례
  int _count2 = 0;

  int get count2 => _count2;

  void incrementCount(){
    _count2++;
    notifyListeners(); // 상태 변경 시 UI 업데이트를 위한 메소드
  }
}