import 'dart:io';

import 'package:flutter/material.dart';

import '../colorCode/colors.dart';

class MyUpload extends StatefulWidget {
  const MyUpload({Key? key}) : super(key: key);

  @override
  State<MyUpload> createState() => _MyUploadState();
}

class _MyUploadState extends State<MyUpload> {
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
          "My Uploads",
          style: TextStyle(color: Color(ColorCodes.bg)),
        ),
      ),
      

      body: GridView.count(
        crossAxisCount: 1,
        children: List.generate(20, (index) {
          return Container(
            decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(ColorCodes.bg)),
            child: Container(
              
              child: Row(
                children: [
                  Container(
                    height: h * 0.15,
                    width: w * 0.3,
                    //width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Image border
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(48), // Image radius
                        child: Image.asset('assets/chewcal.jpg', fit: BoxFit.fill),
                      ),
                    ),
          
                    alignment: Alignment.center,
                  ),
                  Container(
                    height: h * 0.25,
                    width: w * 0.7,
                    //width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          height: h * 0.08,
                          child: Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(left: 20, top: 20),
                                  child: Text(
                                    "Medicine Name",
                                    style: TextStyle(color: Colors.white),
                                  )),
                              Spacer(
                                flex: 1,
                              ),
                              Container(
                                child: InkWell(
                                  child: (Platform.isAndroid)
                                      ? Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                        )
                                      : Icon(
                                          Icons.more_horiz,
                                          color: Colors.white,
                                        ),
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: h * 0.05,
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 30),
                                child: Text(
                                  "City Name",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 5),
                                child: Text("Views: 20",
                                    style: TextStyle(color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                        Container(height: h * 0.02, child: Divider()),
                        Container(
                          height: h * 0.045,
                          child: Row(
                            children: [
                              Container(
                                width: w*0.2,
                                height: h*0.1,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(ColorCodes.font)),
                                child: Text("Approved",
                                    style: TextStyle(color: Colors.white)),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 5),
                                child: Text("8 days ago",
                                    style: TextStyle(color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: h * 0.05,
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: Text("Your Medicine has been lived",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
