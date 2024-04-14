import 'package:flutter/material.dart';
import 'package:to_do/routes.dart';
import 'package:to_do/view/add_task/add_task.dart';
import 'package:to_do/view/task_list/task_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) =>
            TaskListPage(tasks: List.empty(growable: true)),
        AppRoutes.add: (context) => const AddTaskPage()
      },
    );
  }
}
