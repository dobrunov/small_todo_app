import 'package:flutter/material.dart';
import 'package:small_todo_app/screens/home_page.dart';

void main() {
  runApp(const MySmallTodoApp());
}

class MySmallTodoApp extends StatelessWidget {
  const MySmallTodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Small todo app',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomePage(),
    );
  }
}
