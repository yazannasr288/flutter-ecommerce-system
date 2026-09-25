import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/successresetpasswordcontroller.dart';
import '../../../core/constant/color.dart';
import '../../../view/widget/auth/custom_text_titlt_auth.dart' show Customtexttitltauth;
import '../auth/custombuttonauth.dart';


class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.only(top: 25),
          child: Customtexttitltauth(
            texttr: "44".tr,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 40),
            Customtexttitltauth(
              texttr: "43".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Colors.green,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 10),
            Customtexttitltauth(
              texttr: "40".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: Custombuttonauth(
                text: "41".tr,
                onPressed: () {
                  controller.gotopageLogin();
                },
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
