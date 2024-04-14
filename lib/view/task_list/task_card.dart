import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do/model/task.dart';

class TaskCard extends StatelessWidget {
  TaskCard({required this.task, super.key});

  final DateFormat dateFormatter = DateFormat('dd-MM-yyyy HH:mm');
  final Task task;
  String formatDate(DateTime date) => dateFormatter.format(date);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key('${task.id}tile'),
      leading: Text(task.title),
      subtitle: Text(formatDate(task.dueTo)),
    );
  }
}
