import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medpill_fyp/colorCode/colors.dart';
import 'package:medpill_fyp/common/custom_field.dart';

import 'Register.dart';
import 'backend/auth.dart';
import 'conrollers/main_controller.dart';

class VerificationOTP extends StatelessWidget {
  var phonenumcontroller = TextEditingController();
  var passwordControllre = TextEditingController();

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
                  CustomTextField(
                    controller: phonenumcontroller,
                    label: 'Phone Number',
                    hint: 'Enter Your Phone Number',
                    h: h,
                  ),
                  CustomTextField(
                    controller: passwordControllre,
                    label: 'Password',
                    hint: 'Enter Your Password',
                    h: h,
                    isPass: true,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Are You Admin?'),
                      SizedBox(width: 5),
                      Obx(
                        () => Switch(
                          value: controller.isAdmin.value,
                          onChanged: (onChanged) =>
                              controller.isAdmin(onChanged),
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () => controller.isLoading.value
                        ? CircularProgressIndicator()
                        : TextButton(
                            onPressed: () {
                              if (!formKey.currentState!.validate()) return;
                              AuthHelper().login(
                                phone: phonenumcontroller.text.trimRight(),
                                pass: passwordControllre.text,
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(ColorCodes.bg),
                                ),
                                height: 40,
                                width: 80,
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                  InkWell(
                    onTap: () {
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
