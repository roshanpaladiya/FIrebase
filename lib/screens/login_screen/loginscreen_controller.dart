import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roshanpaladiya_firebase/model/model_class.dart';
import 'package:roshanpaladiya_firebase/screens/home_screen/home_screen.dart';
import 'package:roshanpaladiya_firebase/screens/signup_screen/signup_screen.dart';
import 'package:roshanpaladiya_firebase/services/firebase_service.dart';
import 'package:roshanpaladiya_firebase/services/preffernce_service.dart';
import 'package:roshanpaladiya_firebase/utils/firebase_res.dart';

class LoginPageController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void textSignUpButton() {
    Get.to(() => const SignUpPage());
  }

  Future<void> loginUserCheckFunction() async {
    Map? allData = await FirebaseServices.getAllData(FirebaseRes.userData);
    List<Map<String, dynamic>> userJsonList = [];
    List<NewAddUser>? loginUserList;
    if (allData != null) {
      print(allData);
      allData.forEach((key, value) {
        Map<String, dynamic> userData = {};
        userData['id'] = key;
        value.forEach((key1, value1) {
          userData[key1.toString()] = value1;
          print(userData);
        });
        print(userData);
        userJsonList.add(userData);
      });
      loginUserList = newAddUserFromJson(jsonEncode(userJsonList));
      bool value = loginUserList.any((element) =>
          element.email == email.text && element.password == password.text);
      if (value) {
        int indexList = loginUserList.indexWhere((element) =>
            element.email == email.text && element.password == password.text);
        NewAddUser loginUser = loginUserList[indexList];
        PrefServices.setValue('loginUser', jsonEncode(loginUser));
        Get.off(() => const HomePage());
      } else {
        Get.snackbar("incorrect details", "Please enter valid details");
      }
    }
    update(["check"]);
  }
}