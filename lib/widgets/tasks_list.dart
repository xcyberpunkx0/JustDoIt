// This code defines a Flutter widget called `TasksList` that is responsible for displaying a list of tasks. It utilizes the Provider package for state management and depends on the `TaskData` class for managing the tasks. Here's a breakdown of this code:
// 1. Import statements: The code imports the necessary packages and files, including `flutter/material.dart`, `task_tile.dart`, `provider.dart`, and `task_data.dart`.
// 2. `TasksList` class: This is a stateless widget that represents a list of tasks.
// 3. `Consumer` widget: The `Consumer` widget is used to listen to changes in the `TaskData` class, which is managed by the Provider package. It takes three parameters:
//    - `context`: The current build context.
//    - `taskData`: An instance of the `TaskData` class that holds the task data.
//    - `child`: This parameter is not used in the provided code.
// 4. `ListView.builder`: This is a widget that builds a scrollable list of items lazily. It creates a list of `TaskTile` widgets based on the tasks stored in `taskData`. It uses the `itemBuilder` function to generate each `TaskTile` widget based on the task's properties.
// 5. `TaskTile` widgets: For each task in `taskData.tasks`, a `TaskTile` widget is created. These widgets display task information, such as the task title and whether it is checked or not. The `checkboxCallback` and `longPressCallback` functions are defined to handle interactions with the task, such as marking it as done or deleting it.
// 6. `itemCount`: The `itemCount` parameter is set to `taskData.taskCount`, which determines the number of items in the list. It relies on the `taskCount` property of `taskData`.

import 'package:flutter/material.dart';
import 'package:just_do_it/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:just_do_it/models/task_data.dart';

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
              isChecked: task.isDone,
              checkboxCallback: (bool value) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
