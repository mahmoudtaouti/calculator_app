import 'package:calculatorapp/screen.dart';
import 'package:calculatorapp/calculator_brain/calculator_helper.dart';
import 'board_button.dart';
import 'package:flutter/material.dart';

class NumbersBoard extends StatelessWidget {
  NumbersBoard({Key key, this.onClick}) : super(key: key);
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    Helper helper = Helper();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            BoardButton(
                text: '7',
                onTap: () {
                  inPut = inPut + '7';

                  onClick();
                }),
            BoardButton(
                text: '8',
                onTap: () {
                  inPut = inPut + '8';

                  onClick();
                }),
            BoardButton(
                text: '9',
                onTap: () {
                  inPut = inPut + '9';

                  onClick();
                }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            BoardButton(
                text: '4',
                onTap: () {
                  inPut = inPut + '4';

                  onClick();
                }),
            BoardButton(
                text: '5',
                onTap: () {
                  inPut = inPut + '5';

                  onClick();
                }),
            BoardButton(
                text: '6',
                onTap: () {
                  inPut = inPut + '6';

                  onClick();
                }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            BoardButton(
                text: '1',
                onTap: () {
                  inPut = inPut + '1';

                  onClick();
                }),
            BoardButton(
                text: '2',
                onTap: () {
                  inPut = inPut + '2';

                  onClick();
                }),
            BoardButton(
                text: '3',
                onTap: () {
                  inPut = inPut + '3';

                  onClick();
                }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            BoardButton(
                text: '.',
                onTap: () {
                  inPut = inPut + '.';

                  onClick();
                }),
            BoardButton(
                text: '0',
                onTap: () {
                  inPut = inPut + '0';
                  onClick();
                }),
            BoardButton(
                text: '=',
                onTap: () {
                  //calculate and output result
                  helper.eqlPressed();
                  onClick();
                }),
          ],
        )
      ],
    );
  }
}
