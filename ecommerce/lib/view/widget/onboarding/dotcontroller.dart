import 'package:ecommerse/controler/onboardingcontroller.dart';
import 'package:ecommerse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasource/static/static.dart';



class CustomDotController extends StatelessWidget {
  const CustomDotController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder:
          (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80),
              ...List.generate(
                onBoardingList.length,
                (index) => AnimatedContainer(
                  margin: const EdgeInsets.only(right: 5),
                  duration: Duration(milliseconds: 900),
                  width: controller.currentPage == index ? 15 : 5,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
