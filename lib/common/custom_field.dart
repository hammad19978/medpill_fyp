import 'package:flutter/material.dart';

import '../colorCode/colors.dart';

Widget getFields({
  h,
  label,
  hint,
  controller,
}) {
  return Column(
    children: [
      Container(
          height: h * 0.035,
          padding: EdgeInsets.only(left: 10),
          alignment: Alignment.topLeft,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(ColorCodes.bg),
            ),
          )),
      Container(
        height: h * 0.1,
        child: TextFormField(
          controller: controller,
          validator: (txt) => txt!.isEmpty ? 'Please fill this Field' : null,
          style: TextStyle(color: Color(ColorCodes.font)),
          maxLength: label.toString().toLowerCase() == 'cnic' ? 13 : 30,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Color(ColorCodes.bg), width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Color(ColorCodes.bg), width: 2),
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
    ],
  );
}
