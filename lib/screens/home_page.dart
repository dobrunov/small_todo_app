import 'package:flutter/material.dart';

import '../app_styles/color_styles.dart';
import '../data/todo_database.dart';
import '../widgets/task_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    db.createInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Small todo app',
          style: TextStyle(color: appBarTextColor),
        ),
        elevation: 0,
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add, color: iconsColor),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
              child: TaskTile(
            taskName: db.toDoList[index],
          ));
        },
      ),
    );
  }
}
