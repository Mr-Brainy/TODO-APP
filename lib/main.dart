import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:show_app/screen/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.cyan,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO APP',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: const TodoList(),
    );
  }
}
