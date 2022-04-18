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

  final controller = Get.find<MainController>();

  @override
  final formKey = GlobalKey<FormState>();
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
                getFields(
                  h: h,
                  label: 'Name',
                  hint: 'Mention Name of yourself please',
                  controller: nameController,
                ),
                getFields(
                  h: h,
                  label: 'Phone',
                  hint: 'Mention Phone No which you keep in mobile please',
                  controller: phoneController,
                ),
                getFields(
                  h: h,
                  label: 'CNIC',
                  hint: 'Mention Cnic of yourself please',
                  controller: cnicController,
                ),
                getFields(
                  h: h,
                  label: 'Email',
                  hint: 'Mention Email of yourself please',
                  controller: emailController,
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
                                user.phone = phoneController.text;
                                user.email = emailController.text;
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
