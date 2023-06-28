import 'package:flutter/material.dart';
import 'package:padc_firebase_tutorial/utils/extensions.dart';
import 'package:padc_firebase_tutorial/view_items/text_view.dart';

class TextFieldAndLabel extends StatelessWidget {
  const TextFieldAndLabel(
      {super.key,
        required this.title,
        required this.hintText,
        required this.onChanged});

  final String title;
  final String hintText;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(text: title),
        10.heightBox(),
        TextField(
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          onChanged: (input) {
            onChanged(input);
          },
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black.withOpacity(0.4)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}