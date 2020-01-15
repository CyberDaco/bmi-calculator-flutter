import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  BottomButton({this.onTap, this.buttonTitle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          buttonTitle,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        color: bottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}
