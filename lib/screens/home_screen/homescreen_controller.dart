import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roshanpaladiya_firebase/model/model_class.dart';
import 'package:roshanpaladiya_firebase/screens/login_screen/login_screen.dart';
import 'package:roshanpaladiya_firebase/screens/signup_screen/signup_screen.dart';
import 'package:roshanpaladiya_firebase/services/firebase_service.dart';
import 'package:roshanpaladiya_firebase/services/preffernce_service.dart';
import 'package:roshanpaladiya_firebase/utils/firebase_res.dart';
import 'package:roshanpaladiya_firebase/utils/string_res.dart';

class HomeScreenController extends GetxController {
  NewAddUser? loginUser;
  List<NewAddUser>? allUserList;

  @override
  void onInit() {
    getLoginUser();
    getSignUpUser();
    super.onInit();
  }

  Future<void> getLoginUser() async {
    String user = PrefServices.getString('loginUser');
    loginUser = NewAddUser.fromJson(jsonDecode(user));
    update(['LoginUserData']);
  }

  Future<void> getSignUpUser() async {
    Map? getUserData = await FirebaseServices.getAllData(FirebaseRes.userData);
    print('=============================== >>>>>>>>>>>> $getUserData');
    List<Map<String, dynamic>> userJsonList = [];
    if (getUserData != null) {
      getUserData.forEach((key, value) {
        Map<String, dynamic> userData = {};
        userData["id"] = key;
        value.forEach((key1, value1) {
          userData[key1] = value1;
        });
        userJsonList.add(userData);
      });
      allUserList = newAddUserFromJson(jsonEncode(userJsonList));
      update(['SignUpUserData']);
    }
  }

  void onPressedLogOutButton() {
    Get.dialog(
      SimpleDialog(
        title: const Text(StringRes.logoutText),
        children: [
          TextButton(
            onPressed: onPressedLogOut,
            child: const Text(
              StringRes.logoutText,
            ),
          ),
          TextButton(
            onPressed: onPressedCancel,
            child: const Text(StringRes.cancelText),
          ),
        ],
      ),
    );
  }

  void onPressedAddAccountButton() {
    Get.dialog(
      SimpleDialog(
        title: const Text(StringRes.addAccountText),
        children: [
          TextButton(
            onPressed: onPressedAddAccount,
            child: const Text(
              StringRes.addAccountText,
            ),
          ),
          TextButton(
            onPressed: onPressedCancel,
            child: const Text(StringRes.cancelText),
          ),
        ],
      ),
    );
  }

  void onPressedLogOut() {
    Get.offAll(() => const LoginPage());
  }

  void onPressedAddNewUser() {
    Get.to(() => const SignUpPage());
  }

  void onPressedAddAccount() {
    Get.offAll(() => const SignUpPage());
  }

  void onPressedCancel() {
    Get.back();
  }
}
