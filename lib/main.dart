import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tutorapp/colors.dart';
import 'package:tutorapp/students/search_screen.dart';
import 'package:tutorapp/teacher/teacherModel/teacher_model.dart';
import 'package:tutorapp/students/search_teacher_profile_info.dart';

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
          primarySwatch: mainMaterialColor,
        ),
        debugShowCheckedModeBanner: false,
        home: SearchScreen());
  }
}
