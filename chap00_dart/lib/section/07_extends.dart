void extendsTest() {

  Dog dog = Dog("흰둥이", 6);
  dog.eat();
}

// 부모클래스
class Animal {
  String _name;

  Animal(this._name);

  void eat() {
    print("$_name 이(가) 밥을 먹습니다.");
  }
}

// 자식 클래스
class Dog extends Animal {
  late int _age; // late 는 나중에 초기화함.

  Dog(String name, int age) : super(name) {  // : -> 초기화 리스트 | super 부분
    this.age = age;
    // Dog 생성자의 본문
  }
  // Dog 를 생성할 때 name , age 를 매개변수로 받음
  int get age => _age;
  // 그냥 age 로 하면 setter 임.

  set age(int value) {
    if (value <= 0) {
      throw ArgumentError("나이가 너무 어려요");
    }
    _age = value;
  }
}