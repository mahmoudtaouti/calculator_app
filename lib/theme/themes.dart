import 'package:calculatorapp/component/constants.dart';
import 'package:flutter/material.dart';


class CalcThemes extends ChangeNotifier{

  bool _isDarkTheme = false;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme(){
    _isDarkTheme = ! _isDarkTheme;
    notifyListeners();
  }

  bool get isDarkTheme => _isDarkTheme;
  static ThemeData get lightTheme => ThemeData.light();
  static ThemeData get darkTheme => ThemeData.dark().copyWith(
    backgroundColor:Colors.indigo,
    scaffoldBackgroundColor: Colors.blueGrey,
    cardColor:Colors.indigo,
  );
}