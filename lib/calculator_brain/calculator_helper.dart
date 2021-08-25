import 'dart:core';
import 'package:calculatorapp/screen.dart';
import 'calculator.dart';

class Helper {
  Calculator calculator = Calculator();

  String lastInPut() {
    return inPut.length < 0 ? inPut.substring(inPut.length - 1) : inPut;
  }

  void eqlPressed() {
    //TODO : test if all brackets is in a valid format
    if (inPut.isNotEmpty) {
      if (calculator.bracketChecker(inPut)) {
        if (!operators.contains(lastInPut())) {
          try {
            // outPut = calculator.calculate(inPut).toString();
            outPut = calculator.calculateWithBrackets(inPut);
          } on Error catch (e) {
            outPut = 'error';
            print(e.stackTrace);
          }
        }
      } else {
        outPut = "incorrect format";
      }
    }else{
      outPut = '0';
    }
  }
}
