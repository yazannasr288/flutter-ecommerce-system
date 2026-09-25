import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:admin/controller/adminaccount/viewcontroller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/data/datasource/remote/adminaccount.dart';
import '../handlingdatacontroller.dart';

class AdminAddcontroller extends GetxController {
  final AdminAccountData adminAccountData = AdminAccountData(Get.find());
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late final TextEditingController username;
  late final TextEditingController email;
  late final TextEditingController password;
  late final TextEditingController phone;

  StatusRequest statusRequest = StatusRequest.none;

  Future<void> addData() async {
    if (!formstate.currentState!.validate()) return;

    update();
    statusRequest = StatusRequest.loading;
    final data = {
      "username": username.text,
      "email": email.text,
      "password": password.text,
      "phone": phone.text,
    };

    final response = await adminAccountData.add(data);
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
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    username.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    super.onClose();
  }
}
