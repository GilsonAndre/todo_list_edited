import 'package:flutter/material.dart';

import 'pages/todo_list_page.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoListPage(),
    );
  }
}
/*
LinearGradient(
          colors: [Color(0xff3d4eaf), Color(0xfff32e20)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      
*/
