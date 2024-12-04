import 'package:flutter/material.dart';
import 'package:indino_project/screens/list_tasks_screen.dart';
import 'package:indino_project/screens/task_details_screen.dart';
import 'package:provider/provider.dart';
import 'providers/task_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/add_task_screen.dart';
import 'screens/about_screen.dart';
import 'screens/task_completed_screen.dart';

void main() {
  runApp(const TaskEaseApp());
}

class TaskEaseApp extends StatelessWidget {
  const TaskEaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.pink,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.pink,
                iconTheme: IconThemeData(color: Colors.green),
              ),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.black),
                bodyMedium: TextStyle(color: Colors.black54),
              ),
              scaffoldBackgroundColor: Colors.white,
            ),
            darkTheme: ThemeData(
              primaryColor: Colors.black,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black,
                iconTheme: IconThemeData(color: Colors.white),
              ),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.white),
                bodyMedium: TextStyle(color: Colors.grey),
              ),
              scaffoldBackgroundColor: const Color(0xFF121212),
            ),
            themeMode:
                themeProvider.isLightTheme ? ThemeMode.light : ThemeMode.dark,
            home: const BottomNavigationBarExample(),
            routes: {
              '/taskDetails': (context) => TaskDetailsScreen(),
              '/about': (context) => AboutScreen(),
              '/taskCompleted': (context) => TaskCompletedScreen(),
            },
          );
        },
      ),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const ListTaskScreen(),
    const AddTaskScreen(),
    TaskCompletedScreen(), // Placeholder for completed tasks
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.isLightTheme
            ? const Color.fromARGB(255, 233, 113, 153)
            : const Color.fromARGB(255, 40, 40, 40),
        title: const Text(
          '༘⋆🌷TaskEase💭₊˚ෆ',
          style: TextStyle(color: Color.fromARGB(255, 5, 119, 9)),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () => Navigator.pushNamed(context, '/about'),
          ),
          Switch(
            value: themeProvider.isLightTheme,
            onChanged: (value) => themeProvider.toggleTheme(),
            activeColor: const Color.fromRGBO(233, 30, 99, 1),
            inactiveThumbColor: const Color.fromARGB(255, 38, 116, 38),
          ),
        ],
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 9, 97, 21)),
      ),
      body: Container(
        color: themeProvider.isLightTheme
            ? const Color.fromARGB(255, 85, 160, 91)
            : const Color.fromARGB(255, 40, 40, 40),
        child: Center(
          child: (_widgetOptions[_selectedIndex] != null)
              ? _widgetOptions[_selectedIndex]
              : const Text('Error: Screen not available'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: themeProvider.isLightTheme
            ? const Color.fromARGB(255, 233, 165, 188)
            : const Color.fromARGB(255, 50, 50, 50),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_task),
            label: 'Add Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Completed',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFDD7D9A),
        unselectedItemColor: themeProvider.isLightTheme
            ? const Color.fromARGB(255, 5, 119, 9)
            : const Color.fromARGB(255, 9, 97, 21),
        onTap: _onItemTapped,
      ),
    );
  }
}
