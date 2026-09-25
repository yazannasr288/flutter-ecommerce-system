import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExit() {
  Get.defaultDialog(
    title: "51".tr,
    middleText: "52".tr,
    titleStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.red,
    ),
    middleTextStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    ),

    actions: [
      ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: Text(
          "53".tr,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          "54".tr,
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
  return Future.value(true);
}
