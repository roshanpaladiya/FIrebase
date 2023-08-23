import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roshanpaladiya_firebase/screens/home_screen/homescreen_controller.dart';
import 'package:roshanpaladiya_firebase/screens/home_screen/homescreen_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return Scaffold(
      appBar: homeAppbar(),
       body: loginUserData(),
    );
  }
}
