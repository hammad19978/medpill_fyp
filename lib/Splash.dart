import 'package:after_layout/after_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medpill_fyp/verificationOTP.dart';
import 'package:medpill_fyp/viewsScreens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    await Firebase.initializeApp();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = prefs.containsKey('user');
    // Get.to(() => Home_Screen());
    // return;
    if (_seen) {
      Get.to(() => Home_Screen());
    } else {
      // await prefs.setBool('seen', true);
      Get.to(() => VerificationOTP());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();
  // TODO: implement afterFirstLayout

}
