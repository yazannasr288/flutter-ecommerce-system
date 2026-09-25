import 'package:delivary/view/widget/auth/custom_text_titlt_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../controller/forgetpassword/veryfiicodecontroller.dart';

class Verifiycode extends StatelessWidget {
  const Verifiycode({super.key});

  @override
  Widget build(BuildContext context) {
    // ضبط اسم المتغير ليكون controller
    final controller = Get.put(VeryfiycodecontrollerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title:  Padding(
          padding: EdgeInsets.only(top: 25),
          child: Customtexttitltauth(
            texttr: "29",
            themeSelector: (theme) => theme.headlineSmall!,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            const SizedBox(height: 25),
            Customtexttitltauth(
              texttr: "30".tr,
              themeSelector: (theme) => theme.headlineMedium!,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Customtexttitltauth(
                textAlign: TextAlign.center,
                texttr: "32".tr,
                themeSelector: (theme) => theme.headlineSmall!,
              ),
            ),
            const SizedBox(height: 70),

            OtpTextField(
              fieldWidth: 50,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: const Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {
                // يمكنك هنا تنفيذ إجراءات أثناء التغيير إن أردت
              },
              onSubmit: (String verificationCode) {
                controller.goToResetpassword(verificationCode);
              },
            ),
          ],
        ),
      ),
    );
  }
}
