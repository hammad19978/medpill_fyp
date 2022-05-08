import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:medpill_fyp/backend/helper.dart';
import 'package:medpill_fyp/conrollers/main_controller.dart';
import 'package:medpill_fyp/model/medicine.dart';
import 'package:medpill_fyp/model/users.dart';

import '../colorCode/colors.dart';

class RequestScreen extends StatefulWidget {
  RequestScreen({Key? key}) : super(key: key) {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      APiMedicineHelper().fetchallAcceptedRequests();
    });
  }

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  // static String ucnic = '';
  // static String uname = '';
  // static String uphone = '';
  // static String uemail = '';

  final controller = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(ColorCodes.bg),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'My Requests',
          style: TextStyle(color: Color(ColorCodes.bg)),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : controller.requestListAdmin.isEmpty
                ? Center(
                    child: Text('Empty'),
                  )
                : ListView.builder(
                    itemCount: controller.requestListAdmin.length,
                    itemBuilder: (ctx, index) {
                      final item = controller.requestListAdmin[index];
                      final byUser = Users.fromMap(item.byPhone);
                      final toUser = Users.fromMap(item.toPhone);
                      // ucnic = byUser.cnic;
                      // uphone = byUser.phone;
                      // uname = byUser.name;
                      // uemail = byUser.email;

                      final medicine = Medicine.fromMap(item.medicineID);
                      if (medicine.uPhoneno == controller.userData.value.phone)
                        return Container(
                          padding: EdgeInsets.all(10),
                          child: Container(
                              padding: EdgeInsets.all(5),
                              height: h * 0.4,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color(ColorCodes.bg), width: 3),
                              ),
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            alignment: Alignment.centerLeft,
                                            height: h * 0.2,
                                            width: w * 0.2,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20), // Image border
                                              child: SizedBox.fromSize(
                                                size: Size.fromRadius(
                                                    48), // Image radius
                                                child: Image.asset(
                                                    'assets/chewcal.jpg',
                                                    fit: BoxFit.fill),
                                              ),
                                            )),
                                        Container(
                                          //width: w*0.6,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                // width: w * 0.5,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons.person),
                                                          Text(
                                                            byUser.name,
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    ColorCodes
                                                                        .font)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    // Container(
                                                    //   padding: EdgeInsets.only(
                                                    //       left: 20),
                                                    //   child: Row(
                                                    //     children: [
                                                    //       Text(
                                                    //         'City: ',
                                                    //         style: TextStyle(
                                                    //             fontSize: 15,
                                                    //             color: Color(
                                                    //                 ColorCodes
                                                    //                     .font)),
                                                    //       ),
                                                    //       Text(
                                                    //         'Rawalpindi',
                                                    //         style: TextStyle(
                                                    //             color: Color(
                                                    //                 ColorCodes
                                                    //                     .font)),
                                                    //       ),
                                                    //     ],
                                                    //   ),
                                                    // ),

                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 20),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                              child: Row(
                                                            children: [
                                                              Text(
                                                                'PhoneNo: ',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        ColorCodes
                                                                            .font)),
                                                              ),
                                                              Text(
                                                                byUser.phone,
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        ColorCodes
                                                                            .font)),
                                                              ),
                                                            ],
                                                          )),
                                                        ],
                                                      ),
                                                    ),
                                                    // Container(
                                                    //   padding: EdgeInsets.only(
                                                    //       left: 30, top: 10),
                                                    //   alignment:
                                                    //       Alignment.bottomLeft,
                                                    //   child: RichText(
                                                    //     text: TextSpan(
                                                    //       children: <TextSpan>[
                                                    //         TextSpan(
                                                    //           text:
                                                    //               'view profile',
                                                    //           recognizer:
                                                    //               TapGestureRecognizer()
                                                    //                 ..onTap =
                                                    //                     () {
                                                    //                   Get.to(
                                                    //                       ProfileScreen());
                                                    //                 },
                                                    //           style: TextStyle(
                                                    //               fontWeight:
                                                    //                   FontWeight
                                                    //                       .w600,
                                                    //               color: Color(
                                                    //                   ColorCodes
                                                    //                       .font)),
                                                    //         ),
                                                    //       ],
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(top: 70),
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary: Color(
                                                                ColorCodes.bg)),
                                                    onPressed: () {
                                                      //launch('tel:03015830402');
                                                      FlutterPhoneDirectCaller
                                                          .callNumber(
                                                              byUser.phone);
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.call,
                                                          color: Colors.white,
                                                        ),
                                                        Text(
                                                          'Call',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        )
                                                      ],
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        children: [
                                          Text(
                                            'Medicine Name',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color(ColorCodes.font)),
                                          ),
                                          Text(
                                            medicine.name,
                                            style: TextStyle(
                                                color: Color(ColorCodes.font)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(),
                                    Container(
                                      child: Column(
                                        children: [
                                          Container(
                                              alignment: Alignment.topLeft,
                                              child: Text('Message:',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(
                                                          ColorCodes.font)))),
                                          Text(item.mesaage,
                                              style: TextStyle(
                                                  color:
                                                      Color(ColorCodes.font))),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        );
                      else
                        return Container(height: 0);
                    }),
      ),
    );
  }
}
