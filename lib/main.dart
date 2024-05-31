import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/models/to_do.dart';
import 'package:todo_app/task_detail_page.dart';
import 'package:todo_app/task_page.dart';

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
        var items = List.generate(
          15,
          (index) => ToDo(
            'Sub title of task $index',
            false,
            title: 'Title of task $index',
          ),
        );
        return TaskPage(title: 'All Tasks', items: items);
      case 1:
        var completedItems = List.generate(
          3,
          (index) => ToDo(
            'Sub title of task $index',
            true,
            title: 'Title of task $index',
          ),
        );
        return TaskPage(title: 'Completed Tasks', items: completedItems);
      default:
        throw Exception('Invalid index');
    }
  }

  var _pages = <Widget>[];

  @override
  void initState() {
    super.initState();
    _pages = [getPage(0), getPage(1)];
  }

  @override
  Widget build(BuildContext context) {
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
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
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
            _selectedIndex = value;
          }),
        },
        currentIndex: _selectedIndex,
      ),
      floatingActionButton: IconButton(
        icon: SvgPicture.asset(
          'images/plus.svg',
          width: 30,
          height: 30,
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
          fixedSize: const MaterialStatePropertyAll(Size(70, 70)),
        ),
        onPressed: () async => {
          await Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const TaskDetailPage(),
              settings:
                  const RouteSettings(name: 'todoItem', arguments: null),
            ),
          ),
        },
      ),
    );
  }
}
