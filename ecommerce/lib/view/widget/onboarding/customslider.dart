import 'package:ecommerse/controler/onboardingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomsliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomsliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder:
          (context, i) => Column(
            children: [
              SizedBox(height: 40),
              Text(
                onBoardingList[i].title!,
                style:  TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: AppColor.white,
              ),
              ),
              SizedBox(height: 30),
              Image.asset(
                onBoardingList[i].image!,
                // width: 250,
                height: Get.width/1.5,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  onBoardingList[i].body!,
                    style:  TextStyle(
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
