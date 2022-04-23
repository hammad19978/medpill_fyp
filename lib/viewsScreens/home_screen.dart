import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medpill_fyp/conrollers/main_controller.dart';
import 'package:medpill_fyp/contactUs.dart';
import 'package:medpill_fyp/model/users.dart';
import 'package:medpill_fyp/verificationOTP.dart';
import 'package:medpill_fyp/viewsScreens/profile.dart';
import 'package:medpill_fyp/viewsScreens/request.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Tabs/DonationTab.dart';
import '../Tabs/SaleTab.dart';
import '../colorCode/colors.dart';
import '../privacy_policy.dart';
import 'addMedicine.dart';
import 'myupload.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen>
    with TickerProviderStateMixin {
  var controller = Get.find<MainController>();
  int? _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.medicineListDonatefound = controller.medicineListDonate;
    _page = 0;
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    TabController _controller = new TabController(length: 2, vsync: this);
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    TextEditingController _seachcontr = new TextEditingController();

    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: Color(ColorCodes.bg),
        items: <Widget>[
          Icon(Icons.home_outlined, size: 30, color: Color(ColorCodes.bg)),
          Icon(Icons.add_outlined, size: 30, color: Color(ColorCodes.bg)),
          Icon(Icons.person_outline_rounded,
              size: 30, color: Color(ColorCodes.bg)),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
            Timer(Duration(milliseconds: 560), () {
              //(_page == 1) ? Get.to(AddBook()) : Home_Screen();
              if (_page == 0) {
                Get.to(Home_Screen());
                _page == 0;
              }
              if (_page == 1) {
                Get.to(AddBook());
                _page == 1;
              }
              if (_page == 2) {
                Get.to(ProfileScreen());
                _page == 2;
              }
            });
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(ColorCodes.bg),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(100)),

                // gradient: LinearGradient(
                //   begin: Alignment.topRight,
                //   end: Alignment.bottomLeft,
                //   colors: [

                //     Colors.white,
                //     Color(ColorCodes.bg),
                //   ],
                // ),
              ),
              accountName: Text('Hammad khan'),
              accountEmail: Text('hammadkhan19978@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'HD',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Color(ColorCodes.font),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.upload_outlined, color: Color(ColorCodes.bg)),
              title: Text('My Uploads',
                  style: TextStyle(color: Color(ColorCodes.bg))),
              onTap: () {
                Get.to(MyUpload());
              },
            ),
            ListTile(
              leading: Icon(Icons.upload_outlined, color: Color(ColorCodes.bg)),
              title: Text('My Requests',
                  style: TextStyle(color: Color(ColorCodes.bg))),
              onTap: () {
                Get.to(RequestScreen());
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.contacts_outlined, color: Color(ColorCodes.bg)),
              title: Text('Contact Us',
                  style: TextStyle(color: Color(ColorCodes.bg))),
              onTap: () {
                Get.to(ContactUs());
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.privacy_tip_outlined, color: Color(ColorCodes.bg)),
              title: Text(
                'Privacy Policy',
                style: TextStyle(color: Color(ColorCodes.bg)),
              ),
              onTap: () {
                Get.to(PrivacyPolicy());
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.help_center_outlined, color: Color(ColorCodes.bg)),
              title: Text(
                'Help Center',
                style: TextStyle(color: Color(ColorCodes.bg)),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.share_outlined, color: Color(ColorCodes.bg)),
              title: Text(
                'Share App',
                style: TextStyle(color: Color(ColorCodes.bg)),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined, color: Color(ColorCodes.bg)),
              title: Text(
                'Logout',
                style: TextStyle(color: Color(ColorCodes.bg)),
              ),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('user');
                prefs.clear();
                controller.userData(Users.empty());
                Get.offAll(() => VerificationOTP());
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(ColorCodes.bg),
              padding: EdgeInsets.only(left: 20, top: 20, right: 20),
              height: h * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'MEDPILL',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Container(
                      height: h * 0.15,
                      width: w * 0.15,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(ColorCodes.font),
                        child: InkWell(
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('assets/OIP.jpg'),
                          ),
                          onTap: () => Get.to(ProfileScreen()),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              color: Color(ColorCodes.bg),
              padding: EdgeInsets.all(20),
              height: h * 0.32,
              child: Stack(
                children: [
                  Positioned.fill(
                    bottom: 18,
                    child: Container(
                        height: h * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.5), //color of shadow
                              spreadRadius: 0.5, //spread radius
                              blurRadius: 15, // blur radius
                              offset:
                                  Offset(0, 2), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                            //you can set more BoxShadow() here
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(20), // Image border
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(48), // Image radius
                            child: Image.asset('assets/medpill.jpeg',
                                fit: BoxFit.cover),
                          ),
                        )),
                  ),
                  Positioned.fill(
                    top: h * 0.2,
                    right: 20,
                    left: 20,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.5), //color of shadow
                              spreadRadius: 2, //spread radius
                              blurRadius: 10, // blur radius
                              offset:
                                  Offset(0, 2), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                            //you can set more BoxShadow() here
                          ],
                          color: Colors.white
                          //            gradient: LinearGradient(
                          //   begin: Alignment.topRight,
                          //   end: Alignment.bottomLeft,
                          //   colors: [
                          //     Colors.orange.shade50,
                          //     Colors.orange.shade100,
                          //   ],
                          // )

                          ),
                      height: h * 0.5,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            width: w * 0.6,
                            child: TextField(
                              controller: _seachcontr,
                              decoration: InputDecoration(hintText: 'search'),
                              style: TextStyle(
                                  color: Color(ColorCodes.font),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                child: Icon(Icons.search_rounded,
                                    color: Color(ColorCodes.bg)),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color(ColorCodes.bg),
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.topLeft,
              height: h * 0.05,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Available Medicine',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              height: h * 0.5,
              color: Colors.yellow,
              child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Scaffold(
                    //appBar: AppBar(title: Text("Tabs Screen"),),
                    backgroundColor: Colors.white,
                    body: Column(
                      children: [
                        Container(
                          height: h * 0.05,
                          color: Color(ColorCodes.bg),
                          child: TabBar(
                            controller: _controller,
                            indicatorWeight: 3,
                            labelColor: Colors.white,
                            indicatorColor: Colors.blue,
                            unselectedLabelStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(ColorCodes.font)),
                            labelStyle: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700),
                            tabs: [
                              Tab(
                                // icon: Icon(Icons.add_circle_outline_rounded),
                                text: 'Donation Medicine',
                              ),
                              Tab(
                                  // icon: Icon(Icons.add_circle_outline_rounded),
                                  text: 'Sale Medicine'),
                            ],
                          ),
                        ),
                        Container(
                          height: h * 0.45,
                          child: TabBarView(
                            controller: _controller,
                            // <-- Your TabBarView
                            children: [
                              DonationTabScreen(
                                  keyword: _seachcontr.text.toString()),
                              SaleTabScreen(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
