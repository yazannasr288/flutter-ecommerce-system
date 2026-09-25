import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controler/onboardingcontroller.dart';
import '../../core/constant/background.dart';
import '../../view/widget/onboarding/custombuttononboarding.dart';
import '../../view/widget/onboarding/customslider.dart';
import '../../view/widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: Stack(
        children: [
          GradientWaveBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(flex: 2, child: CustomsliderOnBoarding()),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        CustomDotController(),
                        Spacer(flex: 2),
                        CustomButtonOnboarding(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
