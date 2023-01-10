import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.taskTitle,
    required this.taskCompleted,
    required this.checkboxCallback,
    required this.longpressCallback,
  }) : super(key: key);

  final String taskTitle;
  final bool taskCompleted;
  final Function checkboxCallback;
  final Function longpressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        longpressCallback();
      },
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: taskCompleted ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: taskCompleted,
        onChanged: (newValue) {
          checkboxCallback();
        },
      ),
    );
  }
}
