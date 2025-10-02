import 'package:flutter/material.dart';
import 'package:todo/home/home.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: HomeScreen.routName,
        routes:{
          HomeScreen.routName:(context)=>HomeScreen(),
        },
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}

