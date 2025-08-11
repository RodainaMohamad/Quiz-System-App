import 'package:flutter/material.dart';
import 'package:quiz_system/pages/screen.dart';
import 'package:quiz_system/pages/student.dart';
import 'package:quiz_system/pages/doctor.dart';
import 'package:quiz_system/pages/who_are_u.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "welcome_page",
      routes: {
        "welcome_page":(context)=>WelcomePage(),
        "who_are_u":(context)=>who_are_u(),
        "doctor":(context)=>doctor(),
        "student":(context)=>Student(),
      },
    );
  }
}