
import 'package:flutter/material.dart';

class StatelessTest extends StatelessWidget {
  StatelessTest({super.key}); // 변수 넣을 시 const 빼야 함.
  var a = 1;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Text(a.toString()),
      onPressed: (){
        print(a);
        a++;
      },
    );
  }
}
