import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medpill_fyp/model/medicine.dart';

import '../conrollers/main_controller.dart';

class APiMedicineHelper {
  static String tabelMedicien = 'medicines';

  APiMedicineHelper() {
    controller = Get.find<MainController>();
  }

  late final MainController controller;
  // get all med
  Future<void> fetchAllMedicinesSales() async {
    controller.isLoading(true);
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
      if (medicine.type == 'Donation')
        controller.medicineListDonate.add(medicine);
      else
        controller.medicineListSale.add(medicine);
    } catch (e) {
      showToast('Error Occur!');
    }
    controller.isLoading(false);
  }

  //request for med
  requestForMedicine() {}

  //change med Status
  updateRequestedStatusOfMed() {}
}

showToast(msg) {
  return ScaffoldMessenger.of(Get.context!)
      .showSnackBar(SnackBar(content: Text('$msg')));
}
