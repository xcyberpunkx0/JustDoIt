// This code defines a Flutter widget called `TaskTile`, which is used to display a single task within a list. Here's an explanation of what this code does:
// 1. Import statement: The code imports the necessary package, `flutter/material.dart`.
// 2. `TaskTile` class: This is a stateless widget that represents a single task item in a list.
// 3. Constructor: The `TaskTile` class has a constructor that takes four parameters:
//    - `isChecked`: A boolean that indicates whether the task is checked (completed) or not.
//    - `taskTitle`: A string that represents the title or description of the task.
//    - `checkboxCallback`: A function that should be called when the checkbox is tapped or changed.
//    - `longPressCallback`: A function that should be called when the tile is long-pressed.
// 4. `build` method: This method is called to build the widget, and it returns a `ListTile` widget.
// 5. `ListTile` widget: This is a standard Flutter widget for displaying a list item, typically used in lists. It is commonly used for tasks or items in various types of lists.
//    - `onLongPress`: This property is set to the `longPressCallback` function, so when a user long-presses on the tile, the provided function is executed. This is commonly used for actions like deleting a task.
//    - `title`: This displays the `taskTitle` text using a `Text` widget. The text style is set to use a line-through decoration if `isChecked` is `true`, which is a common way to visually indicate that a task is completed.
//    - `trailing`: This is typically used for a widget that appears on the right side of the list item. In this case, it displays a `Checkbox` widget. The `activeColor` property sets the color of the checkbox, and `value` is set to `isChecked`, representing whether the checkbox should be checked or not. The `onChanged` property is set to the `checkboxCallback` function, so when the checkbox is tapped, this function is called to update the task's completion status.


import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressCallback;

  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkboxCallback,
      this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
