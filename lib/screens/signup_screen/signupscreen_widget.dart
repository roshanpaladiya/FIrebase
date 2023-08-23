import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roshanpaladiya_firebase/screens/common_screen/common_textFeild.dart';
import 'package:roshanpaladiya_firebase/screens/signup_screen/signup_screen_controller.dart';
import 'package:roshanpaladiya_firebase/services/preffernce_service.dart';
import 'package:roshanpaladiya_firebase/utils/preff_res.dart';

Widget signUpPageNameTextField() {
  return GetBuilder<SignUpPageController>(
    builder: (controller) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: commonTextField(
          "Name",
          "Name",
          const Icon(Icons.account_box_rounded),
          false,
          controller.name,
          TextInputType.text),
    ),
  );
}

Widget signUpPageEmailTextField() {
  return GetBuilder<SignUpPageController>(
    builder: (controller) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: commonTextField(
          "E-mail",
          "E-mail",
          const Icon(Icons.mail_lock_outlined),
          false,
          controller.email,
          TextInputType.emailAddress),
    ),
  );
}

Widget signUpPageStateTextField() {
  return GetBuilder<SignUpPageController>(
    builder: (controller) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: commonTextField("State", "State", const Icon(Icons.home), true,
          controller.state, TextInputType.text),
    ),
  );
}

Widget signUpPagePinTextField() {
  return GetBuilder<SignUpPageController>(
    builder: (controller) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: commonTextField("PinCode", "PinCode", const Icon(Icons.pin), true,
          controller.pinCode, TextInputType.number),
    ),
  );
}

Widget signUpPagePasswordTextField() {
  return GetBuilder<SignUpPageController>(
    builder: (controller) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: commonTextField("Password", "Password", const Icon(Icons.password),
          true, controller.password, TextInputType.text),
    ),
  );
}

Widget signUpButton() {
  return GetBuilder<SignUpPageController>(
    builder: (controller) => Padding(
      padding: const EdgeInsets.only(bottom: 50, top: 30),
      child: SizedBox(
        height: 50,
        width: 200,
        child: ElevatedButton(
          onPressed: () {
            PrefServices.setValue(PrefRes.isSignUp, true);
            controller.signUpButton();
          },
          child: const Text('Sign Up'),
        ),
      ),
    ),
  );
}
