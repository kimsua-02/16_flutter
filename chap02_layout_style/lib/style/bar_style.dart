
import 'package:flutter/material.dart';

class MyBar extends StatelessWidget {
  const MyBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GangnamStagram", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: (){},
              icon: Icon(
                Icons.favorite_border,
                color: Colors.black,
          )),
          IconButton(onPressed: (){},
              icon: Icon(
                Icons.message_outlined,
                color: Colors.black,
              ))
        ],
      ),

      body: Column(
        children: [
          Expanded(child: Container(
            color: Colors.white,
          )),
          Container(
            height: 100,
            child: Row(
              children: [
                Flexible(child: Container(
                  color: Colors.red,
                ),
                flex: 1,
                ),
                Flexible(child: Container(
                  color: Colors.blueGrey,
                ),
                flex: 2),
              ],
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
                color: Colors.white,
            ),
            IconButton(onPressed: (){},
                icon: Icon(Icons.search),
                color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
