import 'package:flutter/material.dart';

class WidthBox extends StatelessWidget {
  const WidthBox({Key? key, required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width,);
  }
}
