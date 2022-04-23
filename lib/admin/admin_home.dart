import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:medpill_fyp/backend/helper.dart';
import 'package:medpill_fyp/conrollers/main_controller.dart';
import 'package:medpill_fyp/model/medicine.dart';
import 'package:medpill_fyp/model/users.dart';
import 'package:medpill_fyp/verificationOTP.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHomeScreen extends StatelessWidget {
  AdminHomeScreen({Key? key}) : super(key: key) {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      APiMedicineHelper().fetchallRequests();
    });
  }

  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pending Requests'),
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
              Get.off(() => VerificationOTP());
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : controller.requestListAdmin.isEmpty
                ? Center(
                    child: Text('Empty'),
                  )
                : ListView.builder(
                    itemCount: controller.requestListAdmin.length,
                    itemBuilder: (context, index) {
                      final item = controller.requestListAdmin[index];
                      final byUser = Users.fromMap(item.byPhone);
                      final toUser = Users.fromMap(item.toPhone);
                      final medicine = Medicine.fromMap(item.medicineID);

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          dense: true,
                          leading: Image.network(
                            medicine.imgs.isEmpty ? '' : medicine.imgs.first,
                            errorBuilder: (ctx, _, __) {
                              return Icon(Icons.error);
                            },
                          ),
                          title: Text(
                            'Med Name: ' +
                                medicine.name +
                                '\n Expire: ' +
                                medicine.expireDate,
                          ),
                          subtitle: Text(
                            'Request By:\nName: ' +
                                byUser.name +
                                '\nPhone: ' +
                                byUser.phone,
                          ),
                          trailing: controller.isStatusLoading.value
                              ? Text('Processing')
                              : item.status == 'accept'
                                  ? Text('Accepted')
                                  : Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              item.status = 'accept';
                                              APiMedicineHelper()
                                                  .updateRequestStatus(item);
                                            },
                                            icon:
                                                Icon(Icons.done_all_outlined)),
                                        IconButton(
                                            onPressed: () {
                                              item.status = 'reject';
                                              APiMedicineHelper()
                                                  .updateRequestStatus(item);
                                            },
                                            icon: Icon(Icons.cancel)),
                                      ],
                                    ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
