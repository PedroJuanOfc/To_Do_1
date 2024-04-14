// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:to_do/model/task.dart';
import 'package:to_do/routes.dart';
import 'package:to_do/view/task_list/delete_task_modal.dart';
import 'package:to_do/view/task_list/task_card.dart';

class TaskListPage extends StatefulWidget {
  TaskListPage({super.key, required this.tasks, required this.onRemove});

  List<Task> tasks;
  final void Function(Task task) onRemove;

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
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
                final taskKey = Key(task.id);
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    showDialog(
                      context: context,
                      builder: (context) => const DeleteTaskModal(),
                    ).then((mustDelete) {
                      if (mustDelete) widget.onRemove(task);
                    });
                  },
                  key: taskKey,
                  child: TaskCard(task: task),
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
