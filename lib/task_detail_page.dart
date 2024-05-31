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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: TextEditingController(text: item?.title ?? ''),
              decoration: const InputDecoration(
                labelText: 'Title',
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20), // Add this line
            TextField(
              controller: TextEditingController(text: item?.subTitle ?? ''),
              decoration: const InputDecoration(
                labelText: 'Detail',
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            IconButton(
              onPressed: () => print('ADD clicked'),
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Theme.of(context).colorScheme.primary,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              icon: const Text(
                'ADD',
                style: TextStyle(
                  height: 2.5,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
