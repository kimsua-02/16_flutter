
import 'package:flutter/material.dart';

class TextTest extends StatefulWidget {
  const TextTest({super.key});

  @override
  State<TextTest> createState() => _TexttestState();
}

class _TexttestState extends State<TextTest> {

  var textStyle = TextStyle(color: Colors.deepPurple);

  @override
  Widget build(BuildContext context) {
    return Text("반갑습니다.",style: textStyle);
  }
}
