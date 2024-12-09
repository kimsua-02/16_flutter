
/*
* Dart 에서는 기본적으로 변수를 선언할 때
* 초기화를 하지 않으면 에러가 나도록 되어있다.
* null-aware 연산자를 통해 Null 처리를 고려할 수 있다.
* */

void nullSafetyTest() {

  // 선언 시 초기화를 하지 않으면 에러 발생
  String? name; // ? 를 해놓으면 값이 들어오기 전에도 사용 가능함. null 이기 때문.
                // ? 가 없으면 값이 들어오지 못함.
  print(name);

  /*
  * ??=
  * null 병합 할당
  *  - null 이 할당되어 있는 경우에만 값을 할당하는 연산자.
  *  - 기본값을 설정하거나 초기값을 주는 데 유용하다.
  * 자동으로 기본값을 할당할 수 있다.
  * */

  String? value1;
  String value2 = "not null";

  // 상수 존재함. const.
  value1 ??= "null 값이셔서 할당됨";
  value2 ??= "null이 아니라서 할당되지 않음";
  print(value1);
  print(value2);

  // is, is! - 타입 확인
  int X = 10;
  if (X is int) {
    print('X 는 정수형입니다.');
  }

  // 스프레드 연산자
  var numbers = [1,2,3];
  var moreNumbers = [...numbers, if (numbers.length < 5) 4];
  print(moreNumbers);


}