import 'package:flutter/material.dart';
import 'package:to_do/model/task.dart';
import 'package:to_do/routes.dart';
import 'package:to_do/view/add_task/add_task.dart';
import 'package:to_do/view/task_list/task_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Task> tasks = [];

  void addTask(Task newTask) {
    setState(() {
      if (tasks.contains(newTask)) return;
      tasks.add(newTask);
    });
  }

  void removeTask(Task task) {
    setState(() {
      if (!tasks.contains(task)) return;
      tasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => TaskListPage(
              tasks: tasks,
              onRemove: removeTask,
            ),
        AppRoutes.add: (context) => AddTaskPage(
              onAdd: addTask,
            )
      },
    );
  }
}
