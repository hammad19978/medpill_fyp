import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medpill_fyp/backend/helper.dart';
import 'package:medpill_fyp/conrollers/main_controller.dart';
import 'package:medpill_fyp/model/medicine.dart';
import 'package:medpill_fyp/model/users.dart';

class AdminHomeScreen extends StatelessWidget {
  AdminHomeScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pending Requests'),
      ),
      body: ListView.builder(
        itemCount: controller.requestListAdmin.length,
        itemBuilder: (context, index) {
          final item = controller.requestListAdmin[index];
          final byUser = Users.fromMap(item.byPhone);
          final toUser = Users.fromMap(item.toPhone);
          final medicine = Medicine.fromMap(item.medicineID);

          return ListTile(
            leading: Image.network(
              medicine.imgs.first,
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
              'Request By:\nName: ' + byUser.name + '\nPhone: ' + byUser.phone,
            ),
            trailing: Row(
              children: [
                IconButton(
                    onPressed: () {
                      item.status = 'accept';
                      APiMedicineHelper().updateRequestStatus(item);
                    },
                    icon: Icon(Icons.done_all_outlined)),
                IconButton(
                    onPressed: () {
                      item.status = 'reject';
                      APiMedicineHelper().updateRequestStatus(item);
                    },
                    icon: Icon(Icons.cancel)),
              ],
            ),
          );
        },
      ),
    );
  }
}
