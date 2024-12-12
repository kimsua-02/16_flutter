

import 'package:flutter/material.dart';

class questionTest extends StatefulWidget {
  const questionTest({super.key});

  @override
  State<questionTest> createState() => _questionTestState();
}

class _questionTestState extends State<questionTest> {

  var inputDataTitle = TextEditingController();
  var inputDataContent = TextEditingController();
  String title = "null";
  String content = "null";

  // children 으로 TextField 감싸기

  /*
  * 일정 등록으로 제목과 내용 입력 받고 취소, 확인을 누를 수 있음.
  * 확인을 누르면 등록한 순서대로 리스트가 등록됨.
  * 등록한 리스트를 클릭하면 제목과 내용이 나오게.
  * 등록 리스트는 맨 왼편에 1부터 번호순으로 나옴.
  * 단, 리스트 삭제 시 하위 리스트 번호가 줄어들면서 위로 올라움.
  *
  * */

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(title != "null")
            Text(title, style: TextStyle(fontSize: 20),),
          SizedBox(height: 20),
          OutlinedButton(child: Text(
              "등록",
              style: TextStyle(fontSize: 15),
          ),
          onPressed: (){
            showDialog(context: context,
                builder: (context){
              return AlertDialog(
                title: Text("일정 등록"),
                content: TextField(
                  controller: inputDataTitle,
                  decoration: InputDecoration(hintText: "제목을 입력하세요"),
                ),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("취소")),
                  TextButton(onPressed: (){
                    setState(() {
                      title = inputDataTitle.text.isNotEmpty
                          ? inputDataTitle.text
                          : title;
                    });
                    Navigator.pop(context);
                  }, child: Text("완료"))
                ],
              );
            });
          },
          )
        ],
      ),
    );
  }
}
