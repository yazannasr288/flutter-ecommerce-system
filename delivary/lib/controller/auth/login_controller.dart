import 'package:delivary/core/constant/routes.dart';
import 'package:delivary/core/services/services.dart';
import 'package:delivary/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../handlingdatacontroller.dart';

abstract class LoginController extends GetxController {
  login();

  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword = true;
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  showpassword() {
    isshowpassword = !isshowpassword;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['delivary_aproove'].toString() == "1") {
            myServices.sharedPreferences.setString(
              "id",
              response['data']['delivary_id'].toString(),
            );
            String delivaryid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences.setString(
              "username",
              response['data']['delivary_name'],
            );
            myServices.sharedPreferences.setString(
              "email",
              response['data']['delivary_email'],
            );
            myServices.sharedPreferences.setString(
              "phone",
              response['data']['delivary_phone'],
            );
            myServices.sharedPreferences.setString("step", "2");

            FirebaseMessaging.instance.subscribeToTopic("delivary");

            Get.offAllNamed(AppRoutes.homepage);
            Get.snackbar(
              "166".tr,
              "${myServices.sharedPreferences.getString("username")}",
              // Added const here is not possible because string is dynamic
            );
          } else {
            Get.defaultDialog(title: "63".tr, middleText: "66".tr);
            statusRequest = StatusRequest.failure;
          }
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }
}
