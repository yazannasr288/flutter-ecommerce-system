import 'dart:io';

import 'package:ecommerse/core/constant/routes.dart';
import 'package:ecommerse/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settingscontroller extends GetxController {
  RxBool isSwitched = true.obs;

  MyServices myServices = Get.find();

  logut() {
    String usersid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${usersid}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }


  Future<void> openWhatsApp({
    required String phone,
    required String message,
  }) async {
    final Uri whatsappUri =
        Platform.isIOS
            ? Uri.parse(
              "https://wa.me/$phone?text=${Uri.encodeComponent(message)}",
            )
            : Uri.parse(
              "whatsapp://send?phone=$phone&text=${Uri.encodeComponent(message)}",
            );

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
      final Uri webUri = Uri.parse(
        "https://wa.me/$phone?text=${Uri.encodeComponent(message)}",
      );
      if (await canLaunchUrl(webUri)) {
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
      } else {
        throw '82'.tr;
      }
    }
  }





  void toggleNotification(bool value) {
    isSwitched.value = value;
    myServices.sharedPreferences.setBool("notifications", value);

    String userId = myServices.sharedPreferences.getString("id") ?? "";

    if (value) {
      FirebaseMessaging.instance.subscribeToTopic("users");
      FirebaseMessaging.instance.subscribeToTopic("users$userId");
      Get.snackbar("63".tr, "83".tr);
    } else {
      Get.snackbar("63".tr, "84".tr);

      FirebaseMessaging.instance.unsubscribeFromTopic("users");
      FirebaseMessaging.instance.unsubscribeFromTopic("users$userId");
    }
  }

  Widget notificationSwitch() {
    return Obx(
      () => Switch(value: isSwitched.value, onChanged: toggleNotification),
    );
  }

  @override
  void onInit() {
    super.onInit();
    bool savedValue =
        myServices.sharedPreferences.getBool("notifications") ?? true;
    isSwitched.value = savedValue;
  }
}
