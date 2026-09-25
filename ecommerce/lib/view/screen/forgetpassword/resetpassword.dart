import 'package:ecommerse/core/class/handlingdataview.dart';
import 'package:ecommerse/core/function/validinput.dart';
import 'package:ecommerse/view/screen/auth/custombuttonauth.dart';
import 'package:ecommerse/view/widget/auth/custom_text_titlt_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controler/forgetpassword/resetpasswordcontroller.dart';
import '../../../view/widget/auth/custom_text_form_auth.dart .dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.only(top: 25),
          child: Customtexttitltauth(
            texttr: "33".tr,

            themeSelector: (theme) => theme.headlineSmall!,
          ),
        ),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder:
            (contoller) =>
                HandlingdataRequest(statusRequest: contoller.statusRequest, widget
                    : Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                      child: Form(
                        key: contoller.formstate,
                        child: ListView(
                          children: [
                            SizedBox(height: 25),
                            Customtexttitltauth(
                              texttr: "34".tr,
                              themeSelector: (theme) => theme.headlineMedium!,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 10,
                              ),
                              child: Customtexttitltauth(
                                textAlign: TextAlign.center,
                                texttr: "35".tr,
                                themeSelector: (theme) => theme.headlineSmall!,
                              ),
                            ),
                            SizedBox(height: 70),

                            Customtextformauth(
                              valid: (val) {
                                return validInput(val!, 8, 50, "password");
                              },
                              isnumber: false,
                              hinttext: "37".tr,
                              iconData: Icons.lock_clock_outlined,
                              mycontroller: contoller.password,
                              labletext: '',
                            ),
                            Customtextformauth(
                              valid: (val) {
                                return validInput(val!, 8, 50, "password");
                              },
                              isnumber: false,
                              hinttext: "38".tr,
                              iconData: Icons.lock_clock_rounded,
                              mycontroller: contoller.repassword,
                              labletext: '',
                            ),

                            SizedBox(height: 20),
                            Custombuttonauth(
                              text: "36".tr,
                              onPressed: () {
                                contoller.goToSuccessResetPassword();
                              },
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
      ),
    ));
  }
}
