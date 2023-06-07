import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  const TextView({Key? key,required this.text, this.color= Colors.black, this.fontWeight= FontWeight.w700, this.fontSize = 16}) : super(key: key);

  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color),
    );
  }
}
