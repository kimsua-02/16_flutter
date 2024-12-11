
import 'package:flutter/material.dart';

/*
* ListTile
*  - Flutter 에서 리스트 아이템을 간편하게 구성할 수 있는 위젯
*  - 텍스트, 아이콘, 이미지, 등을 간단하게 배치할 수 있어 설정 화면,
* 채팅 목록, 연락처 목록 등의 리스트에서 자주 사용된다.
* */
// 속성을 가지고 있어 리스트 위젯을 편하게 쓸 수 있다.
class ListApp2 extends StatelessWidget {
  const ListApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("리스트 테스트"),
        ),
      ),
      body: ListView(children: [
        ListTile(
          leading: Image.asset("assets/aa.jpg"), // leading : 제일 왼편에 넣음.
          title: Text("내 이름은 아톰"), // title 은 텍스트를 많이 씀
          subtitle: Text("장난감이죠"),
          trailing: Icon(Icons.download),
          onTap: (){}, // 리스트가 선택할 수 있게 해줌.
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        ListTile(
          leading: Image.asset("assets/aa.jpg"), // leading : 제일 왼편에 넣음.
          title: Text("내 이름은 아톰"), // title 은 텍스트를 많이 씀
          subtitle: Text("장난감이죠"),
          trailing: Icon(Icons.download),
          onTap: (){}, // 리스트가 선택할 수 있게 해줌.
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        ListTile(
          leading: Image.asset("assets/aa.jpg"), // leading : 제일 왼편에 넣음.
          title: Text("내 이름은 아톰"), // title 은 텍스트를 많이 씀
          subtitle: Text("장난감이죠"),
          trailing: Icon(Icons.download),
          onTap: (){}, // 리스트가 선택할 수 있게 해줌.
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        ListTile(
          leading: Image.asset("assets/aa.jpg"), // leading : 제일 왼편에 넣음.
          title: Text("내 이름은 아톰"), // title 은 텍스트를 많이 씀
          subtitle: Text("장난감이죠"),
          trailing: Icon(Icons.download),
          onTap: (){}, // 리스트가 선택할 수 있게 해줌.
        ),
      ],),
    );
  }
}
