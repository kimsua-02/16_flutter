
import 'package:flutter/material.dart';

class QuestionTest extends StatelessWidget {
  const QuestionTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("실습 앱", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              )),
          IconButton(onPressed: () {},
              icon: Icon(
                Icons.chat,
                color: Colors.black,
              )),
          IconButton(onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ))
        ],
      ),

      /*
      * 컬럼 안에 로우로 이미지
      * 로우 벗어나서 컨테이너로 텍스트
      *
      * */

      body: Column(
        children: [
          Expanded(child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/good.jpg",
              height: 150,
              )
            ],
          )),
          Container(
            child: Text("아 재밌 ㅋ",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){}, 
                icon: Icon(Icons.home),
                color: Colors.white54,
            ),
            IconButton(onPressed: (){},
                icon: Icon(Icons.search),
                color: Colors.white54,
            ),
            IconButton(onPressed: (){},
                icon: Icon(Icons.download),
                color: Colors.white54,
            ),
            IconButton(onPressed: (){},
                icon: Icon(Icons.face),
                color: Colors.white54,)
          ],
        ),
      ),
    );
  }
}
