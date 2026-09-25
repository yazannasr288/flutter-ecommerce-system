import 'package:ecommerse/controler/auth/verifiycodesignupcontroller.dart';
import 'package:ecommerse/core/class/handlingdataview.dart';
import 'package:ecommerse/view/widget/auth/custom_text_titlt_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class Verifiycodesignup extends StatelessWidget {
  const Verifiycodesignup({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifiycodesignupcontrollerImp());
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
      body: GetBuilder<VerifiycodesignupcontrollerImp>(
        builder:
            (contoller) => HandlingdataRequest(
              statusRequest: contoller.statusRequest,
              widget: Container(
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
                        texttr: "32".tr.replaceAll(
                          '{{email}}',
                          contoller.email!,
                        ),

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
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {
                        print("Verification code submitted: $verificationCode");

                        contoller.goToSuccessSignup(verificationCode);
                      },
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      onTap: () {
                        contoller.resend();
                      },
                      child: Center(
                        child: Text(
                          "102".tr,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
