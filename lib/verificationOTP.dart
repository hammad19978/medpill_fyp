import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medpill_fyp/common/custom_field.dart';

import 'Register.dart';
import 'backend/auth.dart';
import 'conrollers/main_controller.dart';

class VerificationOTP extends StatelessWidget {
  var phonenumcontroller = TextEditingController();
  var otpcontroller = TextEditingController();

  String verificationid = '';

  final formKey = GlobalKey<FormState>();

  final controller = Get.find<MainController>();
  VerificationOTP({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getFields(
                    controller: phonenumcontroller,
                    label: 'Phone Number',
                    hint: 'Enter Your Phone Number',
                    h: h,
                  ),
                  Obx(
                    () => !controller.isOtpSend.value
                        ? Text('')
                        : getFields(
                            controller: otpcontroller,
                            label: 'OTP',
                            hint: 'Enter Your OTP',
                            h: h,
                          ),
                  ),
                  Obx(
                    () => controller.isLoading.value &&
                            !controller.isOtpSend.value
                        ? CircularProgressIndicator()
                        : !controller.isOtpSend.value
                            ? TextButton(
                                onPressed: () async {
                                  if (!formKey.currentState!.validate()) return;
                                  await AuthHelper()
                                      .sendOTP(phone: phonenumcontroller.text);
                                },
                                child: Text('Fetch OTP'),
                              )
                            : Text(''),
                  ),
                  Obx(
                    () => controller.isLoading.value &&
                            controller.isOtpSend.value
                        ? CircularProgressIndicator()
                        : controller.isOtpSend.value
                            ? TextButton(
                                onPressed: () {
                                  if (!formKey.currentState!.validate()) return;
                                  AuthHelper().verfify(sms: otpcontroller.text);
                                },
                                child: Text('Send'),
                              )
                            : Text(''),
                  ),
                  InkWell(
                    onTap: () {
                      controller.isOtpSend(false);
                      !controller.isLoading.value
                          ? Get.to(() => RegisterationScreen())
                          : null;
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Don't Have An Account?",
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: ' Create an account',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
