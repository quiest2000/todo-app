import 'package:flutter/material.dart';

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
    var isAddNew = ModalRoute.of(context)!.settings.arguments as bool;
    print('TaskDetailPage.build isAddNew: $isAddNew');
    var title = isAddNew ? 'Add Task' : 'Edit Task';

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
