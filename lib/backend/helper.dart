import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medpill_fyp/model/medicine.dart';
import 'package:medpill_fyp/model/request.dart';
import 'package:medpill_fyp/model/users.dart';

import '../conrollers/main_controller.dart';

class APiMedicineHelper {
  static String tabelMedicien = 'medicines';
  static String tabelRequest = 'request';

  static String user = 'users';

  APiMedicineHelper() {
    controller = Get.find<MainController>();
  }

  ///////////////////////////////////////////
  ///
  ///                 Request
  // get allRequested  med
  Future<void> fetchallRequests() async {
    controller.requestListAdmin.clear();
    controller.isLoading(true);

    final data = await FirebaseFirestore.instance
        .collection(tabelRequest)
        .where('status', isEqualTo: 'request')
        .get();
    data.docs.forEach((element) {
      Request request = Request.fromMap(element.data());
      request.refrenceID = element.reference.id;
      controller.requestListAdmin.add(request);
    });
    controller.isLoading(false);
  }

  // get allRequestedAccepted  med
  Future<void> fetchallAcceptedRequests() async {
    controller.isLoading(true);
    controller.requestListAdmin.clear();

    try {
      final data = await FirebaseFirestore.instance
          .collection(tabelRequest)
          .where('status', isEqualTo: 'accept')
          .get();

      data.docs.forEach((element) {
        Request request = Request.fromMap(element.data());
        request.refrenceID = element.reference.id;
        controller.requestListAdmin.add(request);
      });
    } catch (e) {}
    controller.isLoading(false);
  }

  //updateRequet Status
  Future<void> updateRequestStatus(Request request) async {
    controller.isStatusLoading(true);
    try {
      await FirebaseFirestore.instance
          .collection(tabelRequest)
          .doc(request.refrenceID)
          .update(request.toMap());
      controller.requestListAdmin.refresh();
      showToast('Status Updated');
    } catch (e) {
      showToast('Status Error');
    }

    controller.isStatusLoading(false);
  }

  ///
  Future<void> requestAMedicine(Map<String, dynamic> request) async {
    controller.isLoading(true);
    try {
      await FirebaseFirestore.instance
          .collection(tabelRequest)
          .add(request)
          .then((value) async {
        print('AFTER _ \n ${value}');
        print((await value.get()).data());
      });
      print(request);
      showToast('Request SuccessFully!');
    } catch (e) {
      showToast('Error Occur!');
    }
    Get.back();
    controller.isLoading(false);
  }
  //////////////////////////////////////////

  late final MainController controller;
  // get all med
  Future<void> fetchAllMedicinesSales() async {
    controller.isLoading(true);
    controller.medicineListSale.clear();
    final data = await FirebaseFirestore.instance
        .collection(tabelMedicien)
        .where('type', isNotEqualTo: 'Donation')
        .get();

    data.docs.forEach((element) {
      controller.medicineListSale.add(Medicine.fromMap(element.data()));
    });
    controller.isLoading(false);
  }

  // get all med
  Future<void> fetchAllMedicinesDonate() async {
    controller.isLoading(true);
    controller.medicineListDonate.clear();
    final data = await FirebaseFirestore.instance
        .collection(tabelMedicien)
        .where('type', isEqualTo: 'Donation')
        .get();

    data.docs.forEach((element) {
      controller.medicineListDonate.add(Medicine.fromMap(element.data()));
    });
    controller.isLoading(false);
  }

  //upload medicine
  Future<void> addNewMedicine(Medicine medicine) async {
    controller.isLoading(true);
    try {
      await FirebaseFirestore.instance
          .collection(tabelMedicien)
          .add(medicine.toMap());
      showToast('Added SuccessFully!');
      // if (medicine.type == 'Donation')
      //   controller.medicineListDonate.add(medicine);
      // else
      //   controller.medicineListSale.add(medicine);
    } catch (e) {
      showToast('Error Occur!');
    }
    controller.isLoading(false);
  }

  //get user by specific medicine
  Future<void> fetchUser(String phoneno) async {
    controller.isLoading(true);
    try {
      final data = await FirebaseFirestore.instance
          .collection(user)
          .where('phone', isEqualTo: '$phoneno')
          .get();

      data.docs.forEach((element) {
        controller.fetchinguserlist.add(Users.fromMap(element.data()));
      });
    } catch (e) {}
    controller.isLoading(false);
  }
}

showToast(msg) {
  return ScaffoldMessenger.of(Get.context!)
      .showSnackBar(SnackBar(content: Text('$msg')));
}
