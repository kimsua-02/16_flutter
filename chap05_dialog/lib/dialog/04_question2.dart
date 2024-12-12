import 'package:flutter/material.dart';

/*
  * 일정 등록으로 제목과 내용 입력 받고 취소, 확인을 누를 수 있음. [ 구현 ]
  * 확인을 누르면 등록한 순서대로 리스트가 등록됨. [ 구현 ]
  * 등록한 리스트를 클릭하면 제목과 내용이 나오게.[ 구현 ]
  * 등록 리스트는 맨 왼편에 1부터 번호순으로 나옴.[ 미구현 ]
  * 단, 리스트 삭제 시 하위 리스트 번호가 줄어들면서 위로 올라옴.[ 미구현 ]
  * 등록한 리스트는 ListView.builder 로 리스트 길이 만큼 itemCount 로 뿌려줌. [ 구현 ]
  * 제목과 내용을 미작성 시 리스트 등록 안 되도록. [ 미구현 ]
  *
  * */

class QuestionTest2 extends StatefulWidget {
  const QuestionTest2({super.key});

  @override
  State<QuestionTest2> createState() => _QuestionTest2State();
}

class _QuestionTest2State extends State<QuestionTest2> {
  var inputDataTitle = TextEditingController();
  var inputDataContent = TextEditingController();
  List<Map<String, String>> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${index + 1}", style: TextStyle(fontSize: 10)),
                  title: Text(todoList[index]['title'] ?? '',
                      style: TextStyle(fontSize: 18)),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.black),
                    onPressed: () {
                      setState(() {
                        todoList.removeAt(index);
                      });
                    },
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(todoList[index]['title'] ?? ''),
                          content: Text(todoList[index]['content'] ?? ''),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("닫기"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
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
                            decoration:
                            InputDecoration(hintText: "제목을 입력하세요"),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: inputDataContent,
                            decoration:
                            InputDecoration(hintText: "내용을 입력하세요"),
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
                              if (inputDataTitle.text.isNotEmpty &&
                                  inputDataContent.text.isNotEmpty) {
                                setState(() {
                                  todoList.add({
                                    'title': inputDataTitle.text,
                                    'content': inputDataContent.text,
                                  });
                                });
                                inputDataTitle.clear();
                                inputDataContent.clear();
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar( // 약간 그냥 안 되는 거 말고 뭔가 디테일 살리고 싶어서 해봄. 구글링 체고 ㅋ
                                    content: Text("제목과 내용을 모두 입력해주세요."),
                                  ),
                                );
                              }
                            },
                            child: Text("완료")),
                      ],
                    );
                  });
            },
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
