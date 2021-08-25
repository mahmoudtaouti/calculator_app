import 'package:calculatorapp/theme/config.dart';
import 'package:calculatorapp/theme/themes.dart';
import 'package:flutter/material.dart';
import 'screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    super.initState();
    //subscribe a listener to currentTheme global that is created in lib/theme/config.dart
    calcThemes.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: CalcThemes.lightTheme,
      darkTheme: CalcThemes.darkTheme,
      themeMode: calcThemes.currentTheme,
      home: Screen0(),
    );
  }
}
