void functionTest() {
  test1("홍길동");

  void innerFun() {
    print("hello");
  }
  innerFun();

  print(" ---- 매개변수와 반환타입 ----");
  print(add(1, 2));

  print(" ---- Optional 매개변수 ---- ");
  print(add2(1, 2, 3));
  print(add2(1 ,2));
}
// oop
// 클래스 내부에서 함수를 정의하지 않기 때문에 클로저를 고려하지 않을 예정 (객체지향)

void test1(String name) {
  print("hello ${name}");
}

String add(int a, int b) {
  return "Sum : ${a + b}";
}

String add2(int a, int b, [int c = 0]){ // 주면 기본값을 c 로 지정함.
  int sum = a + b + c;

  return "Sum2 : ${sum}";
}