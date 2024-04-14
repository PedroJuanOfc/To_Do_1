// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:to_do/model/task.dart';
import 'package:to_do/routes.dart';
import 'package:intl/intl.dart';

class TaskListPage extends StatefulWidget {
  TaskListPage({super.key, required this.tasks});

  List<Task> tasks;
  final DateFormat dateFormatter = DateFormat('dd-MM-yyyy HH:mm');

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  String formatDate(DateTime date) => widget.dateFormatter.format(date);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: widget.tasks.isEmpty
          ? const Center(
              child: Text('No tasks here... Create a task'),
            )
          : ListView.builder(
              itemCount: widget.tasks.length,
              itemBuilder: (context, index) {
                final task = widget.tasks[index];
                return ListTile(
                  key: Key(task.id),
                  leading: Text(task.title),
                  subtitle: Text(formatDate(task.dueTo)),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.add);
        },
      ),
    );
  }
}
