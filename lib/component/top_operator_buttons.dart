import 'package:calculatorapp/screen.dart';
import 'package:flutter/material.dart';
import 'board_button.dart';
//import 'package:calculatorapp/calculator_brain/calculator_helper.dart';

class TopOperatorButtons extends StatelessWidget {
  TopOperatorButtons({Key key, @required this.onClick}) : super(key: key);
  final Function onClick;
  @override
  Widget build(BuildContext context) {
    //Helper goCalc = Helper();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BoardButton(
          text: '(',
          onTap: () {
            inPut = inPut + '(';
            onClick();
          },
        ),
        BoardButton(
          text: ')',
          onTap: () {
            inPut = inPut + ')';
            onClick();
          },
        ),
        BoardButton(
          text: '%',
          onTap: () {
            inPut = inPut + '%';
            onClick();
          },
        ),
      ],
    );
  }
}
