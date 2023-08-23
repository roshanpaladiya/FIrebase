import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roshanpaladiya_firebase/screens/signup_screen/signup_screen_controller.dart';
import 'package:roshanpaladiya_firebase/screens/signup_screen/signupscreen_widget.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpPageController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              signUpPageNameTextField(),
              signUpPageEmailTextField(),
              signUpPageStateTextField(),
              signUpPagePinTextField(),
              signUpPagePasswordTextField(),
              signUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}
