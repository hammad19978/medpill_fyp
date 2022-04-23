import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:medpill_fyp/backend/helper.dart';
import 'package:medpill_fyp/conrollers/main_controller.dart';
import 'package:medpill_fyp/model/medicine.dart';
import 'package:medpill_fyp/model/request.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../colorCode/colors.dart';

class BookDetail extends StatefulWidget {
  //int index;
  Medicine medobj = Medicine.empty();

  @override
  State<BookDetail> createState() => _BookDetailState();
  BookDetail({required this.medobj});
}

class _BookDetailState extends State<BookDetail> {
  final controller = Get.find<MainController>();
  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
  double? _ratingValue;
  var phoneno;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      phoneno = widget.medobj.uPhoneno;
      APiMedicineHelper().fetchUser(phoneno);
    });
  }

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(ColorCodes.bg),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color(ColorCodes.bg),
        title: Text(
          'Medicine Detail',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(ColorCodes.bg),
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                height: h * 0.3,
                child: ImageSlideshow(
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  onPageChanged: (value) {
                    debugPrint('Page changed: $value');
                  },
                  autoPlayInterval: 4000,
                  isLoop: true,
                  children: [
                    Image.asset(
                      'assets/pic1.jpg',
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      'assets/pic2.jpg',
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      'assets/pic3.jpg',
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
              Container(
                height: h * 0.25,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(20),
                        child: Text(
                          widget.medobj.name.toUpperCase(),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        widget.medobj.desc + '    ' + phoneno.toString(),
                        style: TextStyle(color: Colors.grey.shade400),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: h * 0.035,
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Medicine Condition',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
              Container(
                height: h * 0.1,
                child: RatingBar(
                    initialRating: widget.medobj.condition!.toDouble(),
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                        full: const Icon(Icons.star, color: Colors.orange),
                        half: const Icon(
                          Icons.star_half,
                          color: Colors.orange,
                        ),
                        empty: const Icon(
                          Icons.star_outline,
                          color: Colors.orange,
                        )),
                    onRatingUpdate: (value) {
                      setState(() {
                        _ratingValue = value;
                      });
                    }),
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: RaisedButton(
                  onPressed: () {
                    bottomSheet();
                  },
                  child: Text(
                    'Request for the Medicine',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color(ColorCodes.font),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bottomSheet() {
    showBarModalBottomSheet(
      context: context,
      bounce: true,
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height * 0.4,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 24.0),
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: numbers.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Card(
                          color: Colors.blue,
                          child: Container(
                            child: Center(
                                child: Text(
                              numbers[index].toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 36.0),
                            )),
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(ColorCodes.bg),
                  ),
                ),
                child: TextField(
                  maxLines: 3,
                  controller: messageController,
                  decoration: InputDecoration(
                      hintText: 'Write a message...  (optional)'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => controller.isLoading.value
                    ? CircularProgressIndicator(color: Colors.white)
                    : Container(
                        alignment: Alignment.bottomCenter,
                        child: RaisedButton(
                          onPressed: () {
                            Request request = Request.empty();
                            request.byPhone =
                                controller.userData.value.toMap(); // login wala
                            request.toPhone = widget.medobj.toMap();
                            request.medicineID = widget.medobj.toMap();
                            request.status = 'request';
                            request.mesaage = messageController.text;

                            APiMedicineHelper().requestAMedicine(request);
                          },
                          child: Container(
                              child: Text('Request Product',
                                  style: TextStyle(color: Colors.white))),
                          color: Color(ColorCodes.font),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
