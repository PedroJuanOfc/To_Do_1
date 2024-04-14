import 'package:flutter/material.dart';
import 'package:to_do/model/task.dart';
import 'package:to_do/util/date_formatter.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({required this.task, super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key('${task.id}tile'),
      leading: Text(task.title),
      subtitle: Text(DateFormatter.formatDate(task.dueTo)),
    );
  }
}
