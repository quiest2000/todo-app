import 'package:flutter/material.dart';

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
  int selectedIndex = 0;

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return const TaskPage(title: 'All Tasks');
      case 1:
        return const TaskPage(title: 'Completed Tasks');
      default:
        return const TaskPage(title: 'All Tasks');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget page = getPage(selectedIndex);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO: markup the Appbar'),
      ),
      body: Center(
        child: page,
      ),
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
            selectedIndex = value;
          }),
        },
        currentIndex: selectedIndex,
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
      body: Center(
        child: Text(
          'This is the ${widget.title}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
