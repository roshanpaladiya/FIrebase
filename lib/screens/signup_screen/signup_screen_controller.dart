import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roshanpaladiya_firebase/services/firebase_service.dart';
import 'package:roshanpaladiya_firebase/utils/firebase_res.dart';

class SignUpPageController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  TextEditingController password = TextEditingController();

  signUpButton() async {
    Map<String, dynamic> newUserSignupDetails = {
      'name': name.text.trim(),
      'email': email.text.trim(),
      'state': state.text.trim(),
      'pincode': pinCode.text.trim(),
      'password': password.text.trim(),
    };
    await FirebaseServices.addDataInFireBase(
        FirebaseRes.userData, newUserSignupDetails);
    Get.back();
  }
}
