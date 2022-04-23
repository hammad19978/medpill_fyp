import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medpill_fyp/backend/auth.dart';
import 'package:medpill_fyp/backend/helper.dart';
import 'package:medpill_fyp/conrollers/main_controller.dart';
import 'package:medpill_fyp/model/users.dart';

import 'colorCode/colors.dart';
import 'common/custom_field.dart';

class RegisterationScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final controller = Get.find<MainController>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Register Yourself'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  h: h,
                  label: 'Name',
                  hint: 'Mention Name of yourself please',
                  controller: nameController,
                ),
                CustomTextField(
                  h: h,
                  label: 'Phone',
                  hint: 'Mention Phone No which you keep in mobile please',
                  controller: phoneController,
                ),
                CustomTextField(
                  h: h,
                  label: 'CNIC',
                  hint: 'Mention Cnic of yourself please',
                  controller: cnicController,
                ),
                CustomTextField(
                  h: h,
                  label: 'Email',
                  hint: 'Mention Email of yourself please',
                  controller: emailController,
                ),
                CustomTextField(
                  h: h,
                  label: 'Password',
                  hint: 'Enter Your Password',
                  controller: passController,
                  isPass: true,
                ),
                SizedBox(height: 40),
                Obx(
                  () => controller.isLoading.value
                      ? CircularProgressIndicator()
                      : Container(
                          width: w * 0.7,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(ColorCodes.bg)),
                              onPressed: () async {
                                if (!formKey.currentState!.validate()) return;
                                Users user = Users.empty();
                                user.name = nameController.text;
                                user.cnic = cnicController.text;
                                user.phone = phoneController.text.trimRight();
                                user.email = emailController.text;
                                user.password = passController.text;
                                if (!(await AuthHelper()
                                    .register(user: user))) {
                                  //toast;
                                  showToast('Error');
                                }
                              },
                              child: Text('Submit')),
                        ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
