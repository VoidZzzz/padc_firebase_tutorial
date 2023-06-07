import 'package:flutter/material.dart';

class IconView extends StatelessWidget {
  const IconView({Key? key, required this.size, required this.onTap, required this.icon, this.color = Colors.black}) : super(key: key);

  final IconData icon;
  final Color color;
  final double size;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () => onTap(),child: Icon(icon, color: color, size: size,));
  }
}
