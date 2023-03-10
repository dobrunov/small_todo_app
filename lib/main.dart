import 'package:flutter/material.dart';
import 'package:small_todo_app/screens/home_page.dart';

import 'app_styles/color_styles.dart';

void main() {
  runApp(const MySmallTodoApp());
}

class MySmallTodoApp extends StatelessWidget {
  const MySmallTodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Small todo app',
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
      home: const HomePage(),
    );
  }
}
