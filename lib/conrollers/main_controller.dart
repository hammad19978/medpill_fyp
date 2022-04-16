import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:medpill_fyp/model/medicine.dart';

import '../backend/helper.dart';

class MainController extends GetxController {
  var isLoading = false.obs;
  var isOtpSend = false.obs;

  var medicineListDonate = <Medicine>[];
  var medicineListSale = <Medicine>[];

  @override
  void onInit() {
    super.onInit();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      APiMedicineHelper().fetchAllMedicinesDonate();
      APiMedicineHelper().fetchAllMedicinesSales();
    });
  }
}
