import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:admin/controller/adminaccount/viewcontroller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/data/datasource/remote/adminaccount.dart';
import 'package:admin/data/model/adminmodel.dart';

import '../handlingdatacontroller.dart';

class AdminEditcontroller extends GetxController {
  final AdminAccountData adminAccountData = AdminAccountData(Get.find());
  AdminModel? adminModel;

  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late final TextEditingController username;
  late final TextEditingController password;
  late final TextEditingController email;
  late final TextEditingController phone;

  String? aproove;
  StatusRequest statusRequest = StatusRequest.none;

  void changestateactive(String? val) {
    aproove = val;
    update();
  }

  Future<void> editData() async {
    if (!formstate.currentState!.validate()) return;

    update();
    statusRequest = StatusRequest.loading;

    final data = {
      "username": username.text,
      "aproove": aproove,
      "email": email.text,
      "password": password.text,
      "phone": phone.text,
      "id": adminModel!.id!,
      "datenow": DateTime.now().toString(),
    };

    final response = await adminAccountData.edit(data);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.adminaccountview);
        Get.find<AdminViewcontroller>().getData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    adminModel = Get.arguments['adminModel'];

    username = TextEditingController(text: adminModel!.name);
    password = TextEditingController(text: adminModel!.password);
    email = TextEditingController(text: adminModel!.email);
    phone = TextEditingController(text: adminModel!.phone);
    aproove = adminModel!.aproove;

    super.onInit();
  }

  @override
  void onClose() {
    username.dispose();
    password.dispose();
    email.dispose();
    phone.dispose();
    super.onClose();
  }
}
