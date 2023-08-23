import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roshanpaladiya_firebase/screens/common_screen/common_textFeild.dart';
import 'package:roshanpaladiya_firebase/screens/edit_screen/edit_controller.dart';
import 'package:roshanpaladiya_firebase/utils/string_res.dart';

PreferredSizeWidget editProfileAppbar() => AppBar(
      centerTitle: true,
      title: const Text(StringRes.editProfileText),
    );

Widget imagePickView() {
  return GetBuilder<EditProfileController>(
    id: 'image',
    builder: (controller) => controller.images != null
        ? Container(
            height: 100,
            width: Get.width / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: FileImage(
                  controller.images!,
                ),
              ),
              shape: BoxShape.circle,
              color: Colors.blueGrey,
            ),
            child: GestureDetector(
              onTap: () => controller.imagePicker(),
            ),
          )
        : GestureDetector(
            onTap: () => controller.imagePicker(),
            child: Container(
              height: 100,
              width: Get.width / 3,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey,
              ),
            ),
          ),
  );
}

Widget textFieldName() => GetBuilder<EditProfileController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(20),
        child: commonTextField('Name', 'Name', const Icon(Icons.account_box),
            false, controller.name, TextInputType.text),
      ),
    );


Widget textFieldUserName() => GetBuilder<EditProfileController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: commonTextField('email', 'email', const Icon(Icons.mail_outline),
            false, controller.email, TextInputType.text),
      ),
    );


Widget editProfileButton() => GetBuilder<EditProfileController>(
      id: 'edit',
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: controller.onPressedEditProfile,
          child: const Text('Update'),
        ),
      ),
    );
