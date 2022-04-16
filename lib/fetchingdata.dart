import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ShowData.dart';

class Fetching extends StatefulWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  State<Fetching> createState() => _FetchingState();
}

class _FetchingState extends State<Fetching> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget._initialization,
      builder: (context, snapshot)
      {
        if (snapshot.hasError) {
         print("something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            title: 'fetching data using firestore',
            home: ShowData(),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}