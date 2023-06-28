import 'package:flutter/material.dart';
import 'package:padc_firebase_tutorial/utils/extensions.dart';

import '../view_items/text_view.dart';
import '../view_items/textfield_and_label_view.dart';
import 'log_in_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
              text: "Register",
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
              title: "User Name",
              hintText: "Please enter your user name",
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
              text: "Register",
            ),
            40.heightBox(),
            const Center(
              child: TextView(text: "OR"),
            ),
            40.heightBox(),
            LogInAndRegisterSession(
              string: "Login",
              leadingString: "Already have an account?",
              onTapRegister: () => navigateToScreen(
                context,
                const LogInPage(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
