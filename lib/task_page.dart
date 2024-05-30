import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key, required this.title});

  final String title;

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.only(left: 5, right: 5),
          height: 110,
          child: ListItem(
            task: 'Task $index',
            description: 'Description $index',
          ),
        ),
      ),
    );
  }
}


class ListItem extends StatelessWidget {
  final String task;
  final String description;

  const ListItem({super.key, required this.task, required this.description});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(3),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      task.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description.toUpperCase(),
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const SvgIcon(assetName: 'images/Pencil.svg'),
                  onPressed: () => print('Edit clicked'),
                ),
                IconButton(
                  icon: const SvgIcon(assetName: 'images/Trash.svg'),
                  onPressed: () => print('Delete clicked'),
                ),
                IconButton(
                  icon: const SvgIcon(assetName: 'images/CheckCircle.svg'),
                  onPressed: () => print('Complete clicked'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SvgIcon extends StatelessWidget {
  const SvgIcon({
    super.key,
    required this.assetName,
  });
  final String assetName;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: 30,
      height: 30,
    );
  }
}
