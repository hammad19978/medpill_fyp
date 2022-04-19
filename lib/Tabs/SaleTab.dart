import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colorCode/colors.dart';
import '../conrollers/main_controller.dart';
import '../viewsScreens/book_detail.dart';

class SaleTabScreen extends StatefulWidget {
  const SaleTabScreen({Key? key}) : super(key: key);

  @override
  State<SaleTabScreen> createState() => _DonationTabScreenState();
}

class _DonationTabScreenState extends State<SaleTabScreen> {
  final controller = Get.find<MainController>();

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
            () => controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.medicineListSale.isEmpty
                    ? Center(
                        child: Text(
                          'Empty',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : GridView.count(
                        crossAxisCount: 2,
                        children:
                            controller.medicineListSale.map((medicineItem) {
                          return Center(
                            // child: Text(
                            //   'Item $index',
                            //   style: Theme.of(context).textTheme.headline5,
                            // ),
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
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              bottom: 25, right: 20),
                                          child: Text(
                                            medicineItem.name,
                                            style: TextStyle(
                                                color: Color(ColorCodes.font),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11),
                                          ),
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
                              onTap: () =>
                                  Get.to(BookDetail(medobj: medicineItem)),
                            ),
                          );
                        }).toList(),
                      ),
          ),
        ),
      ),
    );
  }
}
