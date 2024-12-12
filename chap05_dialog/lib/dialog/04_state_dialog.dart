

import 'package:flutter/material.dart';

class DialogTest5 extends StatefulWidget {
  const DialogTest5({super.key});

  @override
  State<DialogTest5> createState() => _DialogTest5State();
}

class _DialogTest5State extends State<DialogTest5> {

  var inputData = TextEditingController();
  String name = "null";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(name != "null")
            Text(name, style: TextStyle(fontSize: 25),
            ),
          SizedBox  // 위젯 길이의 간격을 넣을 땐 가벼운 SizeBox 를 쓰는 게 좋음.
            (height: 20,
          ),
          ElevatedButton(child: Text(
            "등록",
            style: TextStyle(fontSize: 20),
          ),
          onPressed: (){
            showDialog(context: context,
                builder: (context){
              return AlertDialog(
                title: Text("이름 입력"),
                content: TextField(
                  controller: inputData,
                  decoration: InputDecoration(hintText: "이름을 입럭하라."),
                ),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("취소")),
                  TextButton(onPressed: (){
                    setState(() {
                      name = inputData.text.isNotEmpty
                          ? inputData.text
                          : name;
                    });
                    Navigator.pop(context);
                  }, child: Text("확인")),
                ],
              );
            });
          }),
        ],
      ),
    );
  }
}
