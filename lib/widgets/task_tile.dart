import 'package:flutter/material.dart';

import '../app_styles/color_styles.dart';

class TaskTile extends StatelessWidget {
  TaskTile({
    Key? key,
    required this.taskName,
    required this.deleteFunction,
  }) : super(key: key);

  final String taskName;
  // Function(BuildContext)? deleteFunction;
  void Function()? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: tileBackgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              taskName,
              style: const TextStyle(
                color: tileTextColor,
              ),
            ),
            InkWell(
              onTap: deleteFunction,
              child: const Icon(Icons.remove_circle, color: iconsColor),
            ),
          ],
        ),
      ),
    );
  }
}
