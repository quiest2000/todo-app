import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/task_detail_page.dart';

import 'models/to_do.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key, required this.title, required this.items});

  final String title;
  final List<ToDo> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items.elementAt(index);
          return Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            height: 110,
            child: ListItem(item: item),
          );
        },
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  // final String title;
  // final String subTitle;
  final ToDo item;

  const ListItem({super.key, required this.item});

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
                      item.title.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.subTitle.toUpperCase(),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const TaskDetailPage(),
                        settings:
                            RouteSettings(name: 'todoItem', arguments: item),
                      ),
                    );
                  },
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
