import 'package:delivary/view/screen/orders/accepted.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/services/services.dart';
import '../view/screen/orders/archive.dart';
import '../view/screen/orders/panding.dart';

abstract class Homescreencontroller extends GetxController {
  changePage(int currentpage);
}

final MyServices myServices = Get.find();

class HomescreencontrollerImp extends Homescreencontroller {
  void logut() {
    final String delivaryid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("delivary");
    FirebaseMessaging.instance.unsubscribeFromTopic("delivary$delivaryid");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }

  int currentPage = 0;

  List<Widget> get listpage => const [
    Panding(),
    Accepted(),
    Archive(),
  ];

  List<Map<String, dynamic>> get buttonappbar => [
    {"title": "183".tr, "icons": Icons.pending},
    {"title": "184".tr, "icons": Icons.library_add_check_rounded},
    {"title": "185".tr, "icons": Icons.archive},
  ];

  @override
  void changePage(int i) {
    currentPage = i;
    update();
  }
}
