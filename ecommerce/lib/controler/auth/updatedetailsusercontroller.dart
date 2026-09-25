import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/login.dart';
import '../handlingdatacontroller.dart';

class UpdateusersdetailsController extends GetxController {
  final LoginData loginData = LoginData(Get.find());
  final MyServices myServices = Get.find();

  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late final TextEditingController username;
  late final TextEditingController phone;

  StatusRequest statusRequest = StatusRequest.none;

  Future<void> editData() async {
    if (formstate.currentState!.validate()) {
      update();
      statusRequest = StatusRequest.loading;

      final response = await loginData.editData(
        myServices.sharedPreferences.getString("id")!,
        username.text,
        phone.text,
      );

      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          myServices.sharedPreferences.setString("username", username.text);
          myServices.sharedPreferences.setString("phone", phone.text);
          Get.offNamed(AppRoutes.homepage);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    username = TextEditingController(
      text: myServices.sharedPreferences.getString("username") ?? '',
    );

    phone = TextEditingController(
      text: myServices.sharedPreferences.getString("phone") ?? '',
    );

    super.onInit();
  }
}
