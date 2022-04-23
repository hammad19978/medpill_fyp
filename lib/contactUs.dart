import 'package:flutter/material.dart';
import 'package:medpill_fyp/colorCode/colors.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: 250,
              child: Center(
                child: Image.asset('assets/medpill.jpeg'),
              ),
            ),
            Container(
              height: 300,
              child: Column(
                children: [
                  Text('Contact Us',
                      style:
                          TextStyle(fontSize: 30, color: Color(ColorCodes.bg))),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                        'Drop us a mail so we can contact you and answer your queries.',
                        style: TextStyle(
                            fontSize: 20, color: Color(ColorCodes.font))),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: TextField(
                      style: TextStyle(color: Color(ColorCodes.font)),
                      decoration: InputDecoration(
                        hintText: 'Drop your mail please',
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
                    width: 200,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(ColorCodes.bg)),
                        onPressed: () {},
                        child: Text('DROP')),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
