import 'package:calculatorapp/component/constants.dart';
import 'package:flutter/material.dart';


class BoardButton extends StatelessWidget {
  BoardButton({this.text, @required this.onTap, this.onLongPress, this.child});
  final Function onTap;
  final String text;
  final Function onLongPress;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0),
      child: InkWell(
        focusColor: Colors.white.withOpacity(0.3),
        onTap: onTap,
        splashColor: Colors.blueGrey,
        borderRadius: BorderRadius.all(Radius.circular(40)),
        onLongPress: onLongPress,
        child: child ??
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text(
                '  ' + text + '  ',
                style: kBoardTextStyle,
              ),
            ),
      ),
    );
  }
}
