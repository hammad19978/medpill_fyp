import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:medpill_fyp/model/medicine.dart';
import 'package:medpill_fyp/model/request.dart';
import 'package:medpill_fyp/model/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../backend/helper.dart';

class MainController extends GetxController {
  var isLoading = false.obs;
  var isStatusLoading = false.obs;

  var isAdmin = false.obs;

  var userData = Users.empty().obs;

  var medicineListDonate = <Medicine>[];
  var medicineListSale = <Medicine>[];

  var requestListAdmin = <Request>[].obs;

  var fetchinguserlist = <Users>[];

  var medicineListDonatefound = <Medicine>[];
  var medicineListListfound = <Medicine>[];

  var result_list_search = <Medicine>[];

  @override
  void onInit() {
    super.onInit();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      var a = Users.fromJson(preferences.containsKey('user')
          ? preferences.getString('user')!
          : '');
      userData(a);
      APiMedicineHelper().fetchAllMedicinesDonate();
      APiMedicineHelper().fetchAllMedicinesSales();
    });
  }
}
