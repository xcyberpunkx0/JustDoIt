// This Dart code defines a `TaskData` class that manages a list of tasks within a Flutter app. 
// It extends `ChangeNotifier`, allowing it to notify listeners of changes in task data. 
// The `_tasks` list contains `Task` objects, initially pre-filled with sample tasks. 
// The class provides methods for core task management: `addTask` adds a new task to the list, `updateTask` toggles a task's completion status, and `deleteTask` removes a task. The `taskCount` getter returns the number of tasks, and the `tasks` getter provides an unmodifiable view of the task list, ensuring data integrity. 
// When tasks change, `notifyListeners` is called to inform widgets to rebuild. 
// This class facilitates efficient task management within a Flutter app.

import 'package:flutter/foundation.dart';
import 'package:just_do_it/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Do Code'),
    Task(name: 'Sleep'),
    Task(name: 'Repeat'),
  ];
  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
