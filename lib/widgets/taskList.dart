import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/widgets/taskTile.dart';
import '../models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
                taskTitle: task.name,
                taskCompleted: task.isDone,
                longpressCallback: () {
                  taskData.deleteTask(task);
                },
                checkboxCallback: () {
                  taskData.updateTask(task);
                });
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
