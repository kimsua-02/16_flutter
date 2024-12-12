

import 'package:flutter/material.dart';

class QuestionTest extends StatefulWidget {
  const QuestionTest({super.key});

  @override
  State<QuestionTest> createState() => _QuestionTestState();
}

class _QuestionTestState extends State<QuestionTest> {
  var inputDataTitle = TextEditingController();
  var inputDataContent = TextEditingController();
  String title = "null";
  String content = "null";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: ListView.builder(
            itemCount: title.length,
            itemBuilder: (content,index){
              return ListTile(
                leading: Text(title[index].toString()),
              );
            },
          )),
          if (title != "null" || content != "null")
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  content,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          SizedBox(height: 20),
          OutlinedButton(
            child: Text(
              "등록",
              style: TextStyle(fontSize: 15),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("일정 등록"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: inputDataTitle,
                            decoration: InputDecoration(hintText: "제목을 입력하세요"),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: inputDataContent,
                            decoration: InputDecoration(hintText: "상세 내용을 입력하세요"),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("취소")),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                title = inputDataTitle.text.isNotEmpty
                                    ? inputDataTitle.text
                                    : title;
                                content = inputDataContent.text.isNotEmpty
                                    ? inputDataContent.text
                                    : content;
                              });
                              Navigator.pop(context);
                            },
                            child: Text("완료")),
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
