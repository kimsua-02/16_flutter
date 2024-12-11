

import 'package:flutter/material.dart';

class foodfighter extends StatefulWidget {
  const foodfighter({super.key});

  @override
  State<foodfighter> createState() => _foodfighterState();
}

// leading : 숫자 넣고
// tran~~ : 버튼 넣고
// ListTitle 에 리딩 넣고.. 하 ...
class _foodfighterState extends State<foodfighter> {
  var a = ['탕','수','육'];
  var b = [0, 0, 0];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, i){
        return ListTile(
          leading: Text(b[i].toString()),
          title: Text(a[i]),
          trailing: ElevatedButton(
          onPressed: (){
            setState(() {
              b[i]++;
            });
          },
            child: Text("잼잼"),
        ),);
      }
    );
  }
}
