import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/onboardingcontroller.dart';
import '../../core/constant/background.dart';
import '../widget/onboarding/custombuttononboarding.dart';
import '../widget/onboarding/customslider.dart';
import '../widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: Stack(
        children: const [
          GradientWaveBackground(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
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
