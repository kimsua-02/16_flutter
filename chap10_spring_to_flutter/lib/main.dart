

import 'package:chap10_spring_to_flutter/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen(),
      routes: {
        "/home":(context)=>HomeScreen(),
      },
    );
  }
}
