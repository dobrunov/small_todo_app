import 'package:flutter/material.dart';

import '../app_styles/color_styles.dart';
import 'dialog_button.dart';

class AddTaskDialog extends StatelessWidget {
  TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  AddTaskDialog({
    Key? key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: dialogBackgroundColor,
      content: SizedBox(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DialogButton(text: "Cancel", onPressed: onCancel, buttonColor: cancelButtonColor),
                DialogButton(text: "Save", onPressed: onSave, buttonColor: saveButtonColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
