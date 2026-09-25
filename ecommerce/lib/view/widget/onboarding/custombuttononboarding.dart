import 'package:ecommerse/controler/onboardingcontroller.dart';
import 'package:ecommerse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnboarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 90),
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
          textStyle: TextStyle(color: AppColor.white),
          padding: EdgeInsets.symmetric(horizontal: 150, vertical: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: AppColor.primaryColor),
          ),
        ),

        onPressed: () {
          controller.next();
        },

        child: Text("9".tr, style: TextStyle(color: AppColor.white)),
      ),
    );
  }
}
