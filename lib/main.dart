import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medpill_fyp/Splash.dart';
import 'package:medpill_fyp/conrollers/main_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyBeYeiC6zRCpmjcmtF-OZuVOGDm6K-wafw',
      appId: '1:1073219977580:android:339c8e600a0af96aceb349',
      messagingSenderId: 'messagingSenderId',
      projectId: 'medpill-26293',
      storageBucket: 'medpill-26293.appspot.com',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllBindings(),
      title: 'App',
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
