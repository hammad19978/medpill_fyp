import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medpill_fyp/backend/helper.dart';
import 'package:medpill_fyp/model/medicine.dart';

import '../colorCode/colors.dart';
import '../conrollers/main_controller.dart';

class AddBook extends StatefulWidget {
  const AddBook({Key? key}) : super(key: key);

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  TextEditingController nameofmed = new TextEditingController();
  TextEditingController formulaofmed = new TextEditingController();
  TextEditingController expiryofmed = new TextEditingController();
  TextEditingController quantityofmed = new TextEditingController();
  TextEditingController priceofmed = new TextEditingController();
  TextEditingController discofmed = new TextEditingController();
  double? _ratingValue;

  String _selectedGender = 'Negotiable';
  List<String> booktype_items = <String>[
    'Donate',
    'Sell',
  ];
  String booktype_dropdownval = 'Donate';

  final controller = Get.find<MainController>();
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;
  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        setState(() {});
      } else {
        print('No image is selected.');
      }
    } catch (e) {
      print('error while picking file.');
    }
  }

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
            'UPLOAD MEDICINE',
            style: TextStyle(color: Color(ColorCodes.bg)),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Container(
                  height: h * 0.04,
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Add Product',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(ColorCodes.font),
                    ),
                  ),
                ),
                Container(
                  height: h * 0.05,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'STAY HEALTHY STAY POSITIVE',
                    style: TextStyle(color: Color(ColorCodes.font)),
                  ),
                ),
                Container(
                    height: h * 0.035,
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Medicine Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(ColorCodes.bg),
                      ),
                    )),
                Container(
                  height: h * 0.1,
                  child: TextField(
                    controller: nameofmed,
                    style: TextStyle(color: Color(ColorCodes.font)),
                    maxLength: 30,
                    decoration: InputDecoration(
                      hintText: 'Enter Name of the medicine',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: Color(ColorCodes.bg), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Color(ColorCodes.bg),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                    height: h * 0.035,
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Formula Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(ColorCodes.bg),
                      ),
                    )),
                Container(
                  height: h * 0.1,
                  child: TextField(
                    controller: formulaofmed,
                    style: TextStyle(color: Color(ColorCodes.font)),
                    maxLength: 30,
                    decoration: InputDecoration(
                      hintText: 'Enter Name of the formula',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: Color(ColorCodes.bg), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Color(ColorCodes.bg),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                    height: h * 0.035,
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Medicine Condition',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(ColorCodes.bg),
                      ),
                    )),
                Container(
                  height: h * 0.1,
                  child: RatingBar(
                      initialRating: 0,
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
                    height: h * 0.035,
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Medicine Expiry Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(ColorCodes.bg),
                      ),
                    )),
                Container(
                  //height: h * 0.1,
                  child: TextField(
                    controller: expiryofmed,
                    style: TextStyle(color: Color(ColorCodes.font)),
                    keyboardType: TextInputType.number,
                    maxLength: 30,
                    decoration: InputDecoration(
                      hintText: 'Enter Expiry Date of the medicine',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: Color(ColorCodes.bg), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Color(ColorCodes.bg),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                    height: h * 0.035,
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Quantity Of Tablets',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(ColorCodes.bg),
                      ),
                    )),
                Container(
                  //height: h * 0.1,
                  child: TextField(
                    controller: quantityofmed,
                    style: TextStyle(color: Color(ColorCodes.font)),
                    keyboardType: TextInputType.number,
                    maxLength: 30,
                    decoration: InputDecoration(
                      hintText: 'Enter Quantity of Tablets',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: Color(ColorCodes.bg), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Color(ColorCodes.bg),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: Color(ColorCodes.bg)),
                  ),
                  child: DropdownButton<String>(
                    onChanged: (String? newvalue) {
                      setState(() {
                        booktype_dropdownval = newvalue!;
                        print(booktype_dropdownval.toString());
                      });
                    },
                    value: booktype_dropdownval,
                    items: booktype_items.map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  ),
                ),
                SizedBox(height: h * 0.035),
                (booktype_dropdownval == 'Sell')
                    ? Container(
                        child: Column(
                          children: [
                            Container(
                                height: h * 0.035,
                                padding: EdgeInsets.only(left: 10),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Medicine Price',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(ColorCodes.bg),
                                  ),
                                )),
                            Container(
                              //height: h * 0.1,
                              child: TextField(
                                controller: priceofmed,
                                style: TextStyle(color: Color(ColorCodes.font)),
                                keyboardType: TextInputType.number,
                                maxLength: 30,
                                decoration: InputDecoration(
                                  hintText: 'Enter Price of the medicine',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: Color(ColorCodes.bg), width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                      color: Color(ColorCodes.bg),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    leading: Radio<String>(
                                      value: 'negotiable',
                                      groupValue: _selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedGender = value!;
                                        });
                                      },
                                    ),
                                    title: const Text('Negotiable'),
                                  ),
                                  ListTile(
                                    leading: Radio<String>(
                                      value: 'non-negotiable',
                                      groupValue: _selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedGender = value!;
                                        });
                                      },
                                    ),
                                    title: const Text('Non-negotiable'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                SizedBox(height: h * 0.035),
                Container(
                    height: h * 0.035,
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Medicine Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(ColorCodes.bg),
                      ),
                    )),
                Container(
                  height: h * 0.2,
                  child: TextField(
                    controller: discofmed,
                    style: TextStyle(color: Color(ColorCodes.font)),
                    maxLines: 6,
                    maxLength: 200,
                    decoration: InputDecoration(
                      hintText: 'Enter description of the medicine',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: Color(ColorCodes.bg), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Color(ColorCodes.bg),
                        ),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   //padding: EdgeInsets.all(20),
                //   child: Column(
                //     children: [
                //       //open button ----------------
                //       Align(
                //         alignment: Alignment.topLeft,
                //         child: ElevatedButton(
                //             style: ElevatedButton.styleFrom(
                //                 primary: Color(ColorCodes.bg)),
                //             onPressed: () {
                //               openImages();
                //             },
                //             child: Text('Open Images')),
                //       ),

                //       Divider(),

                //       imagefiles != null
                //           ? Wrap(
                //               children: imagefiles!.map((imageone) {
                //                 return Container(
                //                     child: Card(
                //                   child: Container(
                //                     height: h * 0.1,
                //                     width: w * 0.1,
                //                     child: Image.file(File(imageone.path)),
                //                   ),
                //                 ));
                //               }).toList(),
                //             )
                //           : Container()
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => controller.isLoading.value
                      ? CircularProgressIndicator()
                      : Container(
                          width: w * 0.7,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(ColorCodes.bg)),
                              onPressed: () {
                                Medicine medicine = Medicine.empty();
                                medicine.name = nameofmed.text;
                                medicine.formula = formulaofmed.text;
                                medicine.condition = _ratingValue;
                                medicine.expireDate = expiryofmed.text;
                                medicine.qty = int.parse(quantityofmed.text);
                                medicine.type = booktype_dropdownval;
                                medicine.desc = discofmed.text;
                                medicine.uPhoneno =
                                    controller.userData.value.phone;
                                APiMedicineHelper().addNewMedicine(medicine);
                              },
                              child: Text('Submit')),
                        ),
                ),
              ],
            ),
          ),
        ));
  }
}
