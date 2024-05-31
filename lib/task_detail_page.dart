import 'package:flutter/material.dart';
import 'package:todo_app/models/to_do.dart';

class TaskDetailPage extends StatefulWidget {
  const TaskDetailPage({super.key});

  void initState() {
    print('TaskDetailPage.initState');
  }

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  @override
  Widget build(BuildContext context) {
    var item = ModalRoute.of(context)!.settings.arguments as ToDo?;

    print('TaskDetailPage.build isAddNew: $item');
    var title = item == null ? 'Add Task' : 'Edit Task';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: false,
        title: Text(
          title,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
          iconSize: 35,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(child: Text('Task Detail Page')),
    );
  }
}
