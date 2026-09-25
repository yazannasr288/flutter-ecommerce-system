import 'package:ecommerse/controler/auth/successresetpasswordcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../view/widget/auth/custom_text_titlt_auth.dart' show Customtexttitltauth;
import '../auth/custombuttonauth.dart';


class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller = Get.put(
      SuccessResetPasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.only(top: 25),
          child: Customtexttitltauth(
            texttr: "44".tr,
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              ),
            ),
            SizedBox(height: 40),
            Customtexttitltauth(
              texttr: "43".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Colors.green,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 10),
            Customtexttitltauth(
              texttr: "40".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: Custombuttonauth(
                text: "41".tr,
                onPressed: () {
                  controller.gotopageLogin();
                },
              ),
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
