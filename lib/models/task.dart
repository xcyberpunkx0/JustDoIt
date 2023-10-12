// The `Task` class represents a task with a name and a completion status (`isDone`). 
// It has a constructor to create a task with an initial status of "not done" (defaulted to `false`). 
// The `toggleDone` method flips the task's status, effectively marking it as done if it was incomplete or vice versa.

class Task {
  final String name;
  bool isDone;

  Task({this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
