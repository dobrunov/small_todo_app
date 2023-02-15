import 'package:flutter/material.dart';

import '../app_styles/color_styles.dart';
import '../data/todo_database.dart';
import '../widgets/add_task_dialog.dart';
import '../widgets/task_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  ToDoDataBase db = ToDoDataBase();

  final TextEditingController _addTaskDialogController = TextEditingController();

  @override
  void initState() {
    db.createInitialData();
    super.initState();
  }

  // create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AddTaskDialog(
            controller: _addTaskDialogController,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add(_addTaskDialogController.text);
      _addTaskDialogController.clear();
    });
    Navigator.of(context).pop();
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
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add, color: iconsColor),
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
