import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/datasource/remote/auth/login.dart';
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
  final LoginData loginData = LoginData(Get.find());
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late final TextEditingController email;
  late final TextEditingController password;
  bool isshowpassword = true;
  final MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  void showpassword() {
    isshowpassword = !isshowpassword;
    update();
  }

  @override
  Future<void> login() async {
    if (!formstate.currentState!.validate()) return;

    statusRequest = StatusRequest.loading;
    update();

    final response = await loginData.postData(email.text, password.text);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        if (response['data']['admin_aproove'].toString() == "1") {
          myServices.sharedPreferences.setString(
            "id",
            response['data']['admin_id'].toString(),
          );

          final adminid = myServices.sharedPreferences.getString("id")!;
          myServices.sharedPreferences.setString(
            "username",
            response['data']['admin_name'],
          );
          myServices.sharedPreferences.setString(
            "email",
            response['data']['admin_email'],
          );
          myServices.sharedPreferences.setString(
            "phone",
            response['data']['admin_phone'],
          );
          myServices.sharedPreferences.setString("step", "2");

          await FirebaseMessaging.instance.subscribeToTopic("admin$adminid");
          await FirebaseMessaging.instance.subscribeToTopic("services");

          Get.offAllNamed(AppRoutes.homepage);
          Get.snackbar("166".tr, "${myServices.sharedPreferences.getString("username")}");
        }
      } else {
        Get.defaultDialog(title: "63".tr, middleText: "66".tr);
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      // token can be used if needed
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
  void goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }
}
