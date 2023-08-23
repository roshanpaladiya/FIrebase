import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roshanpaladiya_firebase/screens/splash_screen/splash_screen.dart';
import 'package:roshanpaladiya_firebase/services/preffernce_service.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PrefServices.init();
  runApp(
    GetMaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
    ),
  );
}