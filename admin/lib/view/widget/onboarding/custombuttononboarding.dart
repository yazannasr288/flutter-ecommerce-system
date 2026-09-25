import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboardingcontroller.dart';
import '../../../core/constant/color.dart';

class CustomButtonOnboarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 90),
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
          textStyle: const TextStyle(color: AppColor.white),
          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: AppColor.primaryColor),
          ),
        ),

        onPressed: () {
          controller.next();
        },

        child: Text(
          "9".tr,
          style: const TextStyle(color: AppColor.white),
        ),
      ),
    );
  }
}
