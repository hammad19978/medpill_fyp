import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colorCode/colors.dart';
import '../conrollers/main_controller.dart';
import '../viewsScreens/med_detail.dart';

class DonationTabScreen extends StatefulWidget {
  final controller = Get.find<MainController>();
  String keyword;

  DonationTabScreen({required this.keyword});

  @override
  State<DonationTabScreen> createState() => _DonationTabScreenState();
}

class _DonationTabScreenState extends State<DonationTabScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_runFilter(widget.keyword);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      child: SingleChildScrollView(
        child: Container(
          color: Color(ColorCodes.bg),
          height: h * 0.45,
          child: Obx(
            () => widget.controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : widget.controller.medicineListDonate.isEmpty
                    ? Center(
                        child: Text(
                          'Empty',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : GridView.count(
                        crossAxisCount: 2,
                        children: widget.controller.medicineListDonatefound
                            .map((medicineItem) {
                          return Center(
                            child: InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.5), //color of shadow
                                      spreadRadius: 0.5, //spread radius
                                      blurRadius: 15, // blur radius
                                      offset: Offset(
                                          0, 2), // changes position of shadow
                                      //first paramerter of offset is left-right
                                      //second parameter is top to down
                                    ),
                                    //you can set more BoxShadow() here
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 140,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        padding: EdgeInsets.only(
                                            bottom: 25, right: 5),
                                        child: Text(
                                          //text alignment set!
                                          medicineItem.name,
                                          style: TextStyle(
                                              color: Color(ColorCodes.font),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        height: 100,
                                        width: 130,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              20), // Image border
                                          child: SizedBox.fromSize(
                                            size: Size.fromRadius(
                                                48), // Image radius
                                            child: Image.network(
                                              medicineItem.imgs.isEmpty
                                                  ? ''
                                                  : medicineItem.imgs.first,
                                              fit: BoxFit.fill,
                                              errorBuilder: (ctx, _, __) {
                                                return Icon(
                                                    Icons.medical_services);
                                              },
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              onTap: () => Get.to(
                                  () => BookDetail(medobj: medicineItem)),
                            ),
                          );
                        }).toList(),
                      ),
          ),
        ),
      ),
    );
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    final controller = Get.find<MainController>();

    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      controller.result_list_search = controller.medicineListDonate;
    } else {
      controller.result_list_search = controller.medicineListDonate
          .where((user) =>
              user.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      controller.medicineListDonatefound = controller.result_list_search;
    });
  }
}
