import 'dart:async';

import 'package:get/get.dart';
import 'package:roshanpaladiya_firebase/screens/login_screen/login_screen.dart';
import 'package:roshanpaladiya_firebase/services/preffernce_service.dart';
import 'package:roshanpaladiya_firebase/utils/preff_res.dart';

class SpleshController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    bool isLogin = PrefServices.getBool(PrefRes.isSignUp);
    Timer(
      const Duration(seconds: 3),
      () => Get.off(() => const LoginPage()),
        /*  Get.off(
        () => isLogin ? const HomePage() : const LoginPage(),
      ),*/
    );
  }
}
