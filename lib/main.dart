import 'package:flutter/material.dart';
import 'package:just_do_it/models/task_data.dart';
import 'package:just_do_it/screens/updated_task_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UpdatedTaskScreen(),
      ),
    );
  }
}
