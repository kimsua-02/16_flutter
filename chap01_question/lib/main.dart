import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: NavTest(title: "네비바 테스트"),
    );
  }
}

class NavTest extends StatelessWidget {
  const NavTest({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:
        Row(mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("네비바 테스트"),
            ]),
      ),

      body: Center(
        child: Image.asset("assets/cat.jpg"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Icon(Icons.home),Icon(Icons.search), Icon(Icons.star), Icon(Icons.add)]
        ),
      ),
    );
  }
}
