import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboardingcontroller.dart';
import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomsliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomsliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: controller.onPageChanged,
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          const SizedBox(height: 30),
          Text(
            onBoardingList[i].title!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: AppColor.white,
            ),
          ),
          const SizedBox(height: 30),
          Image.asset(
            onBoardingList[i].image!,
            height: Get.width / 1.5,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 50),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBoardingList[i].body!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: AppColor.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
