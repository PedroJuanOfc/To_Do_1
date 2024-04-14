import 'package:flutter/material.dart';

class DeleteTaskModal extends StatelessWidget {
  const DeleteTaskModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Deseja realmente excluir a tarefa?'),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('SIM'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('NÃO'),
              )
            ],
          )
        ],
      ),
    );
  }
}
