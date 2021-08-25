import 'package:calculatorapp/component/box.dart';
import 'package:calculatorapp/component/constants.dart';
import 'package:calculatorapp/component/operator_buttons.dart';
import 'package:calculatorapp/component/top_operator_buttons.dart';
import 'package:calculatorapp/theme/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'component/numbers_board.dart';

//TODO : not implemented yet
// input limit 100 digits
// number max 12 digits


//this two variables is global and we use state left up
String inPut = '';
String outPut = '';

class Screen0 extends StatefulWidget {
  @override
  _Screen0State createState() => _Screen0State();
}

class _Screen0State extends State<Screen0> {


  Icon darkIcon =  Icon(Icons.nightlight_round,size: 34,color: Colors.indigo,);
  Icon lightIcon =  Icon(Icons.wb_sunny,size: 34,color: Colors.amberAccent,);

  // this method is called by children, the method is passed as property to the child
  // so we can rebuild the screen
  void callSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [

            //calculator body
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    //this box is a container with the decoration property
                    child: Box(
                      boxColor: calcThemes.isDarkTheme ? kStageDarkColor : kStageColor,
                      shadowOffset:const Offset(0, 0),
                      shadowBlur: 0.0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(4.0, 5.0, 6.0, 6.0),
                              child: TextFormField(
                                autofocus: true,
                                readOnly: true,
                                showCursor: true,
                                textAlign: TextAlign.right,
                                style:  kInPutTextStyle,
                                controller: TextEditingController(
                                    text: inPut,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "0",
                                  labelStyle: kInPutTextStyle,
                                  hintStyle:  kInPutTextStyle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0.5, 10.0, 6.0, 0),
                              child: Text(
                                outPut,
                                style: kOutPutTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    flex:3,
                    child: Box(
                      boxColor:calcThemes.isDarkTheme ? kSecondStageDarkColor : kSecondStageColor,
                      shadowOffset: Offset(0, -3),
                      shadowBlur: 15.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                              child: Box(
                                  boxColor: calcThemes.isDarkTheme ? kSecondStageDarkColor : kSecondStageColor,
                                  shadowOffset:const  Offset(0, 0),
                                  shadowBlur: 0.0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Expanded(
                                        child: Box(
                                          boxColor: calcThemes.isDarkTheme ? kStageDarkColor : kStageColor,
                                          shadowOffset:const Offset(0, 0),
                                          shadowBlur: 0.0,
                                          child: TopOperatorButtons(
                                              onClick: callSetState),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: Box(
                                          boxColor:calcThemes.isDarkTheme ? kNumbersBoxDarkColor : kNumbersBoxColor,
                                          shadowOffset: Offset(0, -2),
                                          shadowBlur: 8.0,
                                          child:
                                              NumbersBoard(onClick: callSetState),
                                        ),
                                      )
                                    ],
                                  )),
                              flex: 3),
                          Expanded(
                              child: Box(
                                boxColor:calcThemes.isDarkTheme ? kOperatorBoxDarkColor : kOperatorBoxColor,
                                shadowOffset:const Offset(-3, 0),
                                shadowBlur: 4.0,
                                child: OperatorButtons(onClick: callSetState),))
                        ],
                      ),
                    )),
              ],
            ),
            Positioned(
              child: IconButton(
                icon:calcThemes.isDarkTheme ? lightIcon : darkIcon,
                onPressed: () {
                  calcThemes.toggleTheme();
                },
              ),
              top: 4.0,
              left: 4.0,
            ),
          ],
        ),
      ),
    );
  }
}
