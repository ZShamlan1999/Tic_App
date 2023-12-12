import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIC APP',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        primaryColor: Colors.blueGrey,
        shadowColor: const Color(0xff001456),
        splashColor: const Color(0xFF4169e8),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
