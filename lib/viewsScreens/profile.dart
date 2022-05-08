import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colorCode/colors.dart';
import '../conrollers/main_controller.dart';
import 'home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
  int? _page;
  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    GlobalKey _bottomNavigationKey = GlobalKey();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.to(Home_Screen());
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        iconTheme: IconThemeData(
          color: Color(ColorCodes.bg),
        ),
        backgroundColor: Color(ColorCodes.bg),
        title: Container(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'MEDPILL',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: h * 0.15,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    controller.userData.value.name,
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(ColorCodes.font),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    controller.userData.value.email,
                    style:
                        TextStyle(fontSize: 13, color: Color(ColorCodes.font)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Color(ColorCodes.font),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/OIP.jpg'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              width: w * 0.8,
              height: h * 0.05,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(ColorCodes.bg),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text('Profile'),
              )),
          SizedBox(
            height: 20,
          ),
          // Container(
          //   padding: EdgeInsets.all(20),
          //   height: h * 0.2,
          //   width: w * 0.8,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     border: Border.all(color: Color(ColorCodes.bg)),
          //   ),
          //   child: Row(
          //     children: [
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             '12',
          //             style: TextStyle(
          //                 fontSize: 35,
          //                 color: Color(ColorCodes.font),
          //                 fontWeight: FontWeight.bold),
          //           ),
          //           Text(
          //             'Uploaded Medicine',
          //             style: TextStyle(
          //                 fontSize: 10,
          //                 color: Color(ColorCodes.font),
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ],
          //       ),
          //       Spacer(),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             '20',
          //             style: TextStyle(
          //                 fontSize: 35,
          //                 color: Color(ColorCodes.font),
          //                 fontWeight: FontWeight.bold),
          //           ),
          //           Text(
          //             'Medicine Owned',
          //             style: TextStyle(
          //                 fontSize: 10,
          //                 color: Color(ColorCodes.font),
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          SizedBox(
            height: h * 0.035,
          ),
          // Container(
          //   padding: EdgeInsets.only(left: 20),
          //   alignment: Alignment.topLeft,
          //   child: Text(
          //     'Uploded Medicine',
          //     style: TextStyle(
          //         color: Color(ColorCodes.font),
          //         fontWeight: FontWeight.bold,
          //         fontSize: 18),
          //   ),
          // ),
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 24.0),
          //   height: MediaQuery.of(context).size.height * 0.2,
          //   child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: numbers.length,
          //       itemBuilder: (context, index) {
          //         return Container(
          //           width: MediaQuery.of(context).size.width * 0.3,
          //           child: Card(
          //             color: Colors.blue,
          //             child: Container(
          //               child: Center(
          //                   child: Text(
          //                 numbers[index].toString(),
          //                 style: TextStyle(color: Colors.white, fontSize: 36.0),
          //               )),
          //             ),
          //           ),
          //         );
          //       }),
          // ),
        ],
      ),
    );
  }
}
