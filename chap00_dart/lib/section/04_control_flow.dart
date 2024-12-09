/*
*  제어문은 다른 언어들과 크게 다르지 않다.
*  - if 문
*  - switch 문
*  - 삼항연산자
*  - for문
*  - while , dowhile 문
*
*  continue 와 break 도 가능하다.
*
* */

void controlFlow() {
  print('----if----');

  bool boolean = true;

  if (boolean) {
    print("boolean : ${boolean}");
  } else {
    print("boolean : ${boolean}");
  }

  print('----else if----');
  bool boolean1 = false;
  bool boolean2 = true;

  if (boolean1) {
    print("boolean1 : ${boolean1}");
  } else if (boolean2) {
    print("boolean2 : ${boolean2}");
  } else {
    print("boolean 1과 2가 false 입니다.");
  }

  print('---- 삼항 연산자 ----');
  int num1 = 200;
  int num2 = 400;
  num1 > num2 ? print("num1이 num2 보다 큽니다.") : print("num1이 num2 보다 작습니다.");

  print('---- switch ----');
  int num = 16;

  switch (num % 3) {
    case 0:
      print("나머지가 없습니다.");
      break;
    case 1:
      print('나머지는 1입니다.');
      break;
    default:
      print('일치하는 조건이 없으면 실행됩니다.');
      break;
  }

  print('----for 문----');

  List<String> foods = ["짜장면", "짬뽕", "탕수육", "양장피", "크림새우"];
  for (var i = 0; i < foods.length; i++) {
    print('food : ${foods[i]}');
  }
// 자바의 foreach 문
  print('----for in 문----');
  for (var food in foods) {
    print('food : ${food}');
  }
}
