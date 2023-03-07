import 'package:flutter/material.dart';
import 'package:tutorapp/colors.dart';
import 'package:tutorapp/features/intro/intro_screen.dart';
import 'package:tutorapp/students/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tutor App',
        theme: ThemeData(
          // useMaterial3: true,
          primarySwatch: primaryColor,
        ),
        debugShowCheckedModeBanner: false,
        home: IntroPage());
  }
}
