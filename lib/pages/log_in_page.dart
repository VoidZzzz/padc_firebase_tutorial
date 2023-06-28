import 'package:flutter/material.dart';
import 'package:padc_firebase_tutorial/pages/register_page.dart';
import 'package:padc_firebase_tutorial/utils/extensions.dart';
import 'package:padc_firebase_tutorial/view_items/text_view.dart';

import '../view_items/textfield_and_label_view.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            100.heightBox(),
            const TextView(
              text: "Login",
              fontSize: 25,
            ),
            50.heightBox(),
            TextFieldAndLabel(
              onChanged: (email) {},
              title: "Email",
              hintText: "Please enter your email",
            ),
            30.heightBox(),
            TextFieldAndLabel(
              onChanged: (password) {},
              title: "Password",
              hintText: "Please enter your password",
            ),
            50.heightBox(),
            AppButton(
              onPressed: () {},
              text: "Login",
            ),
            40.heightBox(),
            const Center(
              child: TextView(text: "OR"),
            ),
            40.heightBox(),
            LogInAndRegisterSession(
              string: "Register",
              leadingString: "Don't have an account?",
              onTapRegister: () => navigateToScreen(
                context,
                const RegisterPage(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LogInAndRegisterSession extends StatelessWidget {
  const LogInAndRegisterSession(
      {super.key,
      required this.leadingString,
      required this.string,
      required this.onTapRegister});

  final Function onTapRegister;
  final String leadingString;
  final String string;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextView(
          text: leadingString,
          fontSize: 13,
        ),
        5.widthBox(),
        GestureDetector(
          onTap: () {
            onTapRegister();
          },
          child: Text(
            string,
            style: const TextStyle(
                fontSize: 13,
                color: Colors.blue,
                decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.bgColor = Colors.black});

  final Function onPressed;
  final String text;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            onPressed();
          },
          child: TextView(
            text: text,
            color: Colors.white,
          )),
    );
  }
}
