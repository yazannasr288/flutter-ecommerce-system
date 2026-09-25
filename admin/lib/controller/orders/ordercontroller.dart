import 'package:admin/view/screen/orders/accepted.dart';
import 'package:admin/view/screen/orders/archive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/orders/panding.dart';

abstract class Ordercontroller extends GetxController {
  void changePage(int currentpage);
}

class OrdercontrollerImp extends Ordercontroller {
  int currentPage = 0;

  List<Widget> get listpage => [
    Panding(),
    Accepted(),
    Archive(),
  ];

  List<Map<String, dynamic>> get buttonappbar => [
    {"title": "189".tr, "icons": Icons.pending},
    {"title": "190".tr, "icons": Icons.library_add_check_rounded},
    {"title": "191".tr, "icons": Icons.archive},
  ];

  @override
  void changePage(int i) {
    if (currentPage != i) {
      currentPage = i;
      update();
    }
  }
}
