import 'package:flutter/material.dart';
import 'package:just_do_it/models/task_data.dart';
import 'package:just_do_it/widgets/header.dart';
import 'package:just_do_it/widgets/tasks_list.dart';
import 'package:provider/provider.dart';

import 'add_task_screen.dart';

class UpdatedTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header(),
          Center(
              child: Text(
            '${Provider.of<TaskData>(context).taskCount} Tasks',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          )),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTaskScreen(),
            ),
          );
        },
      ),
    );
  }
}
