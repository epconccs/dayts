import 'package:dayts/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DaytsApp extends StatefulWidget {
  _DaytsAppState createState() => _DaytsAppState();
}

class _DaytsAppState extends State<DaytsApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      theme: ThemeData(),
      routes: {
        '/': (context) => HomeScreen(),
        //'/game': (context) => GameScreen()
      },
    );
  }
}
