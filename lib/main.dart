import 'package:flutter/material.dart';
import 'package:todolist/screens/todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TodoList',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue[400],
          primaryColorLight: Colors.blue[200],
          primaryColorDark: Colors.blue[600],
          useMaterial3: true,
        ),
        home: TodoPage());
  }
}
