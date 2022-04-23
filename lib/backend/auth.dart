import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:medpill_fyp/admin/admin_home.dart';
import 'package:medpill_fyp/backend/helper.dart';
import 'package:medpill_fyp/model/users.dart';
import 'package:medpill_fyp/viewsScreens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../conrollers/main_controller.dart';

class AuthHelper {
  static String tabelUsers = 'users';
  static String tableAdmin = 'admin';

  FirebaseAuth auth = FirebaseAuth.instance;
  static String verificationid = '';
  static Users user = Users.empty();

  final controller = Get.find<MainController>();

  //request for med
  Future<void> sendOTP({required phone}) async {
    controller.isLoading(true);
    try {
      final db = await FirebaseFirestore.instance
          .collection(tabelUsers)
          .where('phone', isEqualTo: phone)
          .get();

      if (db.docs.isNotEmpty) {
        AuthHelper.user = Users.fromMap(db.docs.first.data());

        await fetchOTP(phone: phone);
        controller.isOtpSend(true);
      } else {
        showToast('User Not Found');
      }
    } catch (e) {
      showToast('Error');
    }
    controller.isLoading(false);
  }

  Future<void> fetchOTP({required phone}) async {
    showToast('PLease Wait');
    await auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        print('Process Complete::::::' + credential.smsCode.toString());
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
        if (e.code == 'invalid-phone-number') {
          print('invalid phone number');
        }
      },
      codeSent: (String verfivationid, int? resendToken) async {
        print('$verificationid ..... ' + resendToken.toString());

        AuthHelper.verificationid = verificationid;
        showToast('SMS Code Sent:' + AuthHelper.verificationid);
      },
      codeAutoRetrievalTimeout: (String verificationid) async {},
    );
  }

  Future<void> verfify({required sms}) async {
    controller.isLoading(true);
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: AuthHelper.verificationid,
      smsCode: sms,
    );

    // Sign the user in (or link) with the credential
    await auth.signInWithCredential(credential).then(
          (value) => print(
            'object : ' + value.user!.phoneNumber.toString(),
          ),
        );
    print(AuthHelper.verificationid);
    if (sms == AuthHelper.verificationid) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('user', AuthHelper.user.toJson());
      controller.isLoading(false);
      Get.to(() => Home_Screen());
    } else {
      showToast('Invalid OTP Code');
    }
    controller.isLoading(false);
  }

  Future<bool> register({required Users user}) async {
    controller.isLoading(true);
    try {
      await FirebaseFirestore.instance.collection(tabelUsers).add(user.toMap());
      controller.isLoading(false);
      Get.back();
      return true;
    } catch (e) {}
    controller.isLoading(false);
    return false;
  }

  Future<bool> login({required phone, required pass}) async {
    controller.isLoading(true);
    try {
      final dbData = await FirebaseFirestore.instance
          .collection(controller.isAdmin.value ? tableAdmin : tabelUsers)
          .where('phone', isEqualTo: phone)
          .where('password', isEqualTo: pass)
          .get();
      if (dbData.docs.isEmpty) {
        controller.isLoading(false);
        showToast('User Not Found!');
        return true;
      }
      ;
      controller.userData(Users.fromMap(dbData.docs.first.data()));
      showToast('Welcome!');
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('user', controller.userData.toJson());
      controller.isLoading(false);
      controller.isAdmin.value
          ? Get.offAll(() => AdminHomeScreen())
          : Get.offAll(() => Home_Screen());
      return true;
    } catch (e) {}
    controller.isLoading(false);
    return false;
  }
}
