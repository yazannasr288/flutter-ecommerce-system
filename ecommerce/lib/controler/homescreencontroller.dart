import 'package:ecommerse/view/screen/notification.dart';
import 'package:ecommerse/view/screen/offer.dart';
import 'package:ecommerse/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screen/home.dart';

abstract class Homescreencontroller extends GetxController {
  changePage(int currentpage);
}

class HomescreencontrollerImp extends Homescreencontroller {
  int currentPage = 0;

  List<Widget> get listpage => [Homepage(), NotificationView(), Offer(), Settings()];
  List<Map<String, dynamic>> get buttonappbar => [
    {"title": "155".tr, "icons": Icons.home},
    {"title": "156".tr, "icons": Icons.notifications},
    {"title": "157".tr, "icons": Icons.local_offer},
    {"title": "158".tr, "icons": Icons.settings},
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
