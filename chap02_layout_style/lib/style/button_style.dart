
import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  const Mybutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Layout-test"),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: (){},
                  child: Text("버튼"),
                style: TextButton.styleFrom(minimumSize: Size(100, 60)),
              ),
              ElevatedButton(onPressed: (){}, child: Text("버튼")),
              IconButton(onPressed: (){}, icon: Icon(Icons.star), iconSize: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
