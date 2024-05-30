import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: const Color(0xff9395D3),
          secondary: const Color(0xffF9A826),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  Widget getPage(int index) {
    switch (index) {
      case 0:
        return const TaskPage(title: 'All Tasks');
      case 1:
        return const TaskPage(title: 'Completed Tasks');
      default:
        throw Exception('Invalid index');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget page = getPage(_selectedIndex);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: false,
        title: const Text(
          'TODO APP',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              color: Colors.white,
              iconSize: 32,
              onPressed: () => {print('Calendar clicked')},
              icon: const Icon(Icons.calendar_month),
            ),
          ),
        ],
      ),
      body: page,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              size: 30,
            ),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check,
              size: 30,
            ),
            label: 'Completed',
          ),
        ],
        onTap: (value) => {
          setState(() {
            _selectedIndex = value;
          }),
        },
        currentIndex: _selectedIndex,
      ),
    );
  }
}

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
