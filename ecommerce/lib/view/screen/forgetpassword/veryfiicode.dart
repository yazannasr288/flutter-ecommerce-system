import 'package:ecommerse/controler/forgetpassword/veryfiicodecontroller.dart';
import 'package:ecommerse/view/widget/auth/custom_text_titlt_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class Verifiycode extends StatelessWidget {
  const Verifiycode({super.key});

  @override
  Widget build(BuildContext context) {
    Veryfiicodecontroller contoller = Get.put(
      VeryfiycodecontrollerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.only(top: 25),
          child: Customtexttitltauth(
            texttr: "29".tr,

            themeSelector: (theme) => theme.headlineSmall!,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            SizedBox(height: 25),
            Customtexttitltauth(
              texttr: "30".tr,
              themeSelector: (theme) => theme.headlineMedium!,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Customtexttitltauth(
                textAlign: TextAlign.center,
                texttr: "32".tr,
                themeSelector: (theme) => theme.headlineSmall!,
              ),
            ),
            SizedBox(height: 70),

            OtpTextField(
              fieldWidth: 50,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {
              },
              onSubmit: (String verificationCode) {
             contoller.goToResetpassword(verificationCode);
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}
