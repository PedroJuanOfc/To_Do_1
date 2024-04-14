import 'package:flutter/material.dart';
import 'package:to_do/model/task.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key, required this.onAdd});

  final void Function(Task newTask) onAdd;

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: const Scaffold(
        body: Center(
          child: Text('Add task form'),
        ),
      ),
    );
  }
}
