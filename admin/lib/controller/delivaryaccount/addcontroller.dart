import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:admin/controller/delivaryaccount/viewcontroller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';

import '../handlingdatacontroller.dart';
import 'package:admin/data/datasource/remote/delivaryaccount.dart';

class DelivaryAddcontroller extends GetxController {
  final DelivaryAccountData delivaryAccountData = DelivaryAccountData(Get.find());
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late final TextEditingController username;
  late final TextEditingController email;
  late final TextEditingController password;
  late final TextEditingController phone;

  StatusRequest statusRequest = StatusRequest.none;

  Future<void> addData() async {
    if (!formstate.currentState!.validate()) return;

    update();

    final data = {
      "username": username.text,
      "email": email.text,
      "password": password.text,
      "phone": phone.text,
    };

    statusRequest = StatusRequest.loading;

    final response = await delivaryAccountData.add(data);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.delivaryaccountview);
        Get.find<DelivaryViewcontroller>().getData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    super.onInit();
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
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
