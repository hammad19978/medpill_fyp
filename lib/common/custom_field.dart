import 'package:flutter/material.dart';

import '../colorCode/colors.dart';

class CustomTextField extends StatefulWidget {
  final h;
  final label;
  final hint;
  final controller;
  final isPass;

  const CustomTextField({
    Key? key,
    this.h,
    this.label,
    this.hint,
    this.controller,
    this.isPass = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: widget.h * 0.035,
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.topLeft,
            child: Text(
              widget.label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(ColorCodes.bg),
              ),
            )),
        Container(
          height: widget.h * 0.1,
          child: TextFormField(
            controller: widget.controller,
            validator: (txt) => txt!.isEmpty ? 'Please fill this Field' : null,
            style: TextStyle(color: Color(ColorCodes.font)),
            obscureText: widget.isPass ? !isVisible : false,
            maxLength:
                widget.label.toString().toLowerCase() == 'cnic' ? 13 : 30,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              suffixIcon: widget.isPass
                  ? !isVisible
                      ? IconButton(
                          onPressed: () {
                            isVisible = !isVisible;
                            setState(() {});
                          },
                          icon: Icon(Icons.remove_red_eye))
                      : IconButton(
                          onPressed: () {
                            isVisible = !isVisible;
                            setState(() {});
                          },
                          icon: Icon(Icons.visibility_off))
                  : Icon(
                      Icons.fiber_manual_record_outlined,
                      color: Colors.transparent,
                    ),
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
}
