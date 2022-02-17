import 'package:flutter/material.dart';

import 'screens/home/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Tesla Animated App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const HomeScreen(),
    ),
  );
}
