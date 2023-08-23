import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roshanpaladiya_firebase/screens/edit_screen/edit_controller.dart';
import 'package:roshanpaladiya_firebase/screens/edit_screen/edit_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileController());

    return Scaffold(
      appBar: editProfileAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imagePickView(),
            textFieldName(),
            textFieldUserName(),
            editProfileButton(),
          ],
        ),
      ),
    );
  }
}
