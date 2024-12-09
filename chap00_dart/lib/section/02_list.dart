
/*
* Dart 는 배열을 따로 제공하지 않는다.
* list 와 Map 을 제공하고, 데이터의 추가 조회 수정 삭제가 가능하다.
* */

void collectionTest() {
  // array 가 없음. 배열이 없고 list 로 사용함.

  print("------ list ------");

  List<String> foods = ["동파육", "탕수육"];  // 배열처럼 사용, Dart 는 안정성 때문에 제네릭 어쩌구는 권장하지 않음.
  print(foods);
  print(foods.length);
  print(foods.first);

  print(foods[0]);
  print(foods[1]);

  // 이중 list 는 잘 사용하지 않음. map 을 사용함.

  // 수정
  foods[0] = "크림새우";
  print(foods);

  // 삭제
  foods.remove('크림새우'); // remove 는 값으로 넣어야 함.
  print(foods);
  // 타입은 오브젝트인데 값이 들어올 때 타입을 지정해줌.

  foods.removeAt(0); // int index
  print(foods);

  print("------ Map ------");

  // dynamic - 타입을 명시적으로 지정하지 않고 동적으로 결정할 수 있다.
  // 서로 다른 타입의 값도 할당할 수 있다.
  Map<String, dynamic> person = {"name" : "홍길동" , "age" : 20, "gender" : "남"};
  // 다트 는 타입에 굉장히 민감하기 때문에 위처럼 남발하면 안 됨.
  print(person);

  // 특정 키값을 가져오려면 다트는 대괄호로 키값으 가져옴
  print(person['name']);

  // 없는 값을 조회해도 에러가 나지 않는다.
  print(person["test"]); // null 이 출력됨

  // 새로운 key 를 넣어서 값을 추가할 수 있다.
  person["hobby"] = ["축구" ,"농구"];
  print(person);

  // 수정 - 기존에 존재하는 key value 값에 새로운 값을 넣는다.
  person['age'] = 21;
  print(person);

  // 삭제
  person.remove('hobby');
  print(person);

}