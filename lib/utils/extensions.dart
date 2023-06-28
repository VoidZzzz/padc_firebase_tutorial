import 'package:flutter/material.dart';

extension NavigationUtility on Widget {
  void navigateToScreen(BuildContext context, Widget nextScreen) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => nextScreen));
  }

  void showSnackBarWithMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}

extension CustomBox on double {
  Widget widthBox() {
    return SizedBox(
      width: this,
    );
  }

  Widget heightBox() {
    return SizedBox(
      height: this,
    );
  }
}

extension CustomBox2 on int {
  Widget widthBox() {
    return SizedBox(
      width: this.toDouble(),
    );
  }

  Widget heightBox() {
    return SizedBox(
      height: this.toDouble(),
    );
  }
}
