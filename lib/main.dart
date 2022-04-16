import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medpill_fyp/Splash.dart';
import 'package:medpill_fyp/conrollers/main_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
//
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllBindings(),
      title: 'App',
      home: Splash(),
    );
  }
}

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
