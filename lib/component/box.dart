import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  Box(
      {@required this.boxColor,
      @required this.shadowOffset,
      @required this.shadowBlur,
      this.child});

  final Color boxColor;
  final shadowOffset;
  final shadowBlur;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: shadowOffset,
              blurRadius: shadowBlur)
        ],
        color: boxColor,
      ),
    );
  }
}
