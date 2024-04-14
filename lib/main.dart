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
  List<Task> tasks = [
    Task(
      id: '1',
      title: 'Create a new project',
      status: TaskStatus.done,
      dueTo: DateTime.now().add(const Duration(days: 1)),
    ),
    Task(
      id: '2',
      title: 'Create models',
      status: TaskStatus.done,
      dueTo: DateTime.now().add(const Duration(days: 2)),
    ),
    Task(
      id: '3',
      title: 'Build form',
      status: TaskStatus.doing,
      dueTo: DateTime.now().add(const Duration(days: 3)),
    ),
    Task(
      id: '4',
      title: 'Deploy',
      status: TaskStatus.toDo,
      dueTo: DateTime.now().add(const Duration(days: 4)),
    ),
  ];

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
      debugShowCheckedModeBanner: false,
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
