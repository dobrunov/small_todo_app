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
  List toDoList1 = [];

  final TextEditingController _addTaskDialogController = TextEditingController();

  @override
  void initState() {
    db.createInitialData();
    toDoList1 = db.toDoList;
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
      toDoList1.add(_addTaskDialogController.text);
      _addTaskDialogController.clear();
    });
    Navigator.of(context).pop();
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      toDoList1.removeAt(index);
      print(toDoList1.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'My to do list',
          style: TextStyle(color: appBarTextColor),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: createNewTask,
              child: const Icon(
                Icons.add,
                size: 28.0,
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: toDoList1.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
              child: TaskTile(
            taskName: toDoList1[index],
            deleteFunction: () => deleteTask(index),
          ));
        },
      ),
    );
  }
}
