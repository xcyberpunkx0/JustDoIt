// This Flutter code defines an `AddTaskScreen`, which is a user interface for adding new tasks to a task management app. 
// It features a full-screen, semi-transparent gray backdrop. The main content is a white container with rounded corners, including a large "Add Task" header and a text input field for entering task titles. 
// As the user types, the `onChanged` function updates the `newTaskTitle` variable. 
// A button labeled "Add" allows the user to confirm and add the new task to the list, with the `Provider` package used to update the task data. After adding a task, the screen is dismissed. 
// This screen provides a simple and focused way to input new tasks in the app.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:just_do_it/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            FlatButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle);
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
            )
          ],
        ),
      ),
    );
  }
}
