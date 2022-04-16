
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colorCode/colors.dart';
import 'myupload.dart';

class Drawerss extends StatefulWidget {
  const Drawerss({ Key? key, required ListView child }) : super(key: key);

  @override
  State<Drawerss> createState() => _DrawerState();
}

class _DrawerState extends State<Drawerss> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(ColorCodes.bg),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(100)),

             
              ),
              accountName: Text("Hammad khan"),
              accountEmail: Text("hammadkhan19978@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "HD",
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Color(ColorCodes.font),
                  ),
                ),
              ),
            ),
            ListTile(
              leading:
                  Icon(Icons.settings_outlined, color: Color(ColorCodes.bg)),
              title: Text("Settings",
                  style: TextStyle(color: Color(ColorCodes.bg))),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.upload_outlined, color: Color(ColorCodes.bg)),
              title: Text("My Uploads",
                  style: TextStyle(color: Color(ColorCodes.bg))),
              onTap: () {
                Get.to(MyUpload());
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.contacts_outlined, color: Color(ColorCodes.bg)),
              title: Text("Contact Us",
                  style: TextStyle(color: Color(ColorCodes.bg))),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.privacy_tip_outlined, color: Color(ColorCodes.bg)),
              title: Text(
                "Privacy Policy",
                style: TextStyle(color: Color(ColorCodes.bg)),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.help_center_outlined, color: Color(ColorCodes.bg)),
              title: Text(
                "Help Center",
                style: TextStyle(color: Color(ColorCodes.bg)),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.share_outlined, color: Color(ColorCodes.bg)),
              title: Text(
                "Share App",
                style: TextStyle(color: Color(ColorCodes.bg)),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.favorite_outline, color: Color(ColorCodes.bg)),
              title: Text(
                "Favorites",
                style: TextStyle(color: Color(ColorCodes.bg)),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined, color: Color(ColorCodes.bg)),
              title: Text(
                "Logout",
                style: TextStyle(color: Color(ColorCodes.bg)),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}