import 'package:ecommerse/controler/orders/archivecontroller.dart';
import 'package:ecommerse/core/constant/color.dart';
import 'package:ecommerse/core/constant/imageassete.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:get/get.dart';



void showdialograting(BuildContext context,String ordersid) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      title: Text(
        '140'.tr,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),

      image: Image.asset(AppImageAssets.appicon, width: 100, height: 100),
      submitButtonText: '141'.tr,
      submitButtonTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColor.primaryColor,
        fontSize: 16,
      ),
      commentHint: "142".tr,
      onCancelled: () => print('143'.tr),
      onSubmitted: (response) {
        Archivecontroller controller = Get.find();
       controller.submetrataing(ordersid,response.rating,response.comment);
      },
    ),
  );
}
