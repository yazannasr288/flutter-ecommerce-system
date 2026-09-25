import 'package:ecommerse/core/constant/routes.dart';
import 'package:ecommerse/core/services/services.dart';
import 'package:ecommerse/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../handlingdatacontroller.dart';

abstract class LoginController extends GetxController {
  login();

  goToSignUp();

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
    isshowpassword = isshowpassword == true ? false : true;
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
          if (response['data']['users_aproove'].toString() == "1") {
            myServices.sharedPreferences.setString(
              "id",
              response['data']['users_id'].toString(),
            );
            String userid = myServices.sharedPreferences.getString("id")!;
            // String userid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences.setString(
              "username",
              response['data']['users_name'],
            );
            myServices.sharedPreferences.setString(
              "email",
              response['data']['users_email'],
            );
            myServices.sharedPreferences.setString(
              "phone",
              response['data']['users_phone'],
            );
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users${userid}");

            Get.offAllNamed(AppRoutes.homepage);
            Get.snackbar("166".tr,"${myServices.sharedPreferences.getString("username")}",
            );
          } else {
            Get.toNamed(
              AppRoutes.verifiyCodeeSignUp,
              arguments: {"email": email.text},
            );
          }
        } else {
          Get.defaultDialog(title: "63".tr, middleText: "66".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print(value);
    //   String? token = value;
    // });
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
