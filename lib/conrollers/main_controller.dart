import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:medpill_fyp/model/medicine.dart';

import '../backend/helper.dart';

class MainController extends GetxController {
  var isLoading = false.obs;
  var isOtpSend = false.obs;

  var medicineListDonate = <Medicine>[];
  var medicineListSale = <Medicine>[];

  var medicineListDonatefound = <Medicine>[];
  var medicineListListfound = <Medicine>[];

  var result_list_search = <Medicine>[];

  @override
  void onInit() {
    super.onInit();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      APiMedicineHelper().fetchAllMedicinesDonate();
      APiMedicineHelper().fetchAllMedicinesSales();
    });
  }
}
