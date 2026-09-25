import 'package:ecommerse/controler/auth/successsignupcontoller.dart';
import 'package:ecommerse/core/constant/color.dart';
import 'package:ecommerse/view/screen/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view/widget/auth/custom_text_titlt_auth.dart';

class Successsignup extends StatelessWidget {
  const Successsignup({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.only(top: 25),
          child: Customtexttitltauth(
            texttr: "39".tr,
            style: TextStyle(color: Colors.green),

            themeSelector: (theme) => theme.headlineSmall!,
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
              texttr: "42".tr,
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
                onPressed: () {controller.gotopageLogin();
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
