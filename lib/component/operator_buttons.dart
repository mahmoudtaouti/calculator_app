import 'package:calculatorapp/calculator_brain/calculator.dart';
import 'package:calculatorapp/calculator_brain/calculator_helper.dart';
import 'package:calculatorapp/component/board_button.dart';
import 'package:calculatorapp/screen.dart';
import 'package:flutter/material.dart';

import 'board_button.dart';

Helper helper = Helper();

class OperatorButtons extends StatelessWidget {
  OperatorButtons({Key key, @required this.onClick}) : super(key: key);
  final Function onClick;
  final String plus = '+';
  final String minus = '-';
  final String multiple = 'x';
  final String divide = '/';

  @override
  Widget build(BuildContext context) {
    //Helper goCalc = Helper();
    return Column(
      children: <Widget>[
        Expanded(
          child: BoardButton(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 40),
              child: Icon(
                Icons.backspace,
                size: 30.0,
              ),
            ),
            onTap: () {
              if (inPut.isNotEmpty) {
                inPut = inPut.substring(0, inPut.length - 1);
                onClick();
              }
            },
            onLongPress: () {
              inPut = '';
              outPut = '';
              onClick();
            },
          ),
          flex: 1,
        ),
        Expanded(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: BoardButton(
                  text: divide,
                  onTap: () {
                    if (operators.contains(helper.lastInPut())) {
                      //to not repeat the operators and replace it
                      inPut = inPut.substring(0, inPut.length - 1) + divide;
                    } else {
                      inPut = inPut + divide;
                    }
                    onClick();
                  },
                ),
              ),
              Expanded(
                child: BoardButton(
                    text: multiple,
                    onTap: () {
                      if (operators.contains(helper.lastInPut())) {
                        inPut = inPut.substring(0, inPut.length - 1) + multiple;
                      } else {
                        inPut = inPut + multiple;
                      }
                      onClick();
                    }),
              ),
              Expanded(
                child: BoardButton(
                  text: minus,
                  onTap: () {
                    if (operators.contains(helper.lastInPut())) {
                      inPut = inPut.substring(0, inPut.length - 1) + minus;
                    } else {
                      inPut = inPut + minus;
                    }
                    onClick();
                  },
                ),
              ),
              Expanded(
                child: BoardButton(
                    text: plus,
                    onTap: () {
                      if (operators.contains(helper.lastInPut())) {
                        inPut = inPut.substring(0, inPut.length - 1) + plus;
                      } else {
                        inPut = inPut + plus;
                      }
                      onClick();
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
