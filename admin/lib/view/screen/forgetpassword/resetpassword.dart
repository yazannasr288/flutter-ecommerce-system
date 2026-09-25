import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/function/validinput.dart';
import 'package:admin/view/screen/auth/custombuttonauth.dart';
import 'package:admin/view/widget/auth/custom_text_titlt_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/forgetpassword/resetpasswordcontroller.dart';
import '../../widget/auth/custom_text_form_auth.dart .dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.only(top: 25),
          child: Customtexttitltauth(
            texttr: "33".tr,
            themeSelector: (theme) => theme.headlineSmall!,
          ),
        ),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) => HandlingdataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  const SizedBox(height: 25),
                  Customtexttitltauth(
                    texttr: "34".tr,
                    themeSelector: (theme) => theme.headlineMedium!,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Customtexttitltauth(
                      textAlign: TextAlign.center,
                      texttr: "35".tr,
                      themeSelector: (theme) => theme.headlineSmall!,
                    ),
                  ),
                  const SizedBox(height: 70),

                  Customtextformauth(
                    valid: (val) => validInput(val!, 8, 50, "password"),
                    isnumber: false,
                    hinttext: "37".tr,
                    iconData: Icons.lock_clock_outlined,
                    mycontroller: controller.password,
                    labletext: '',
                  ),
                  Customtextformauth(
                    valid: (val) => validInput(val!, 8, 50, "password"),
                    isnumber: false,
                    hinttext: "38".tr,
                    iconData: Icons.lock_clock_rounded,
                    mycontroller: controller.repassword,
                    labletext: '',
                  ),

                  const SizedBox(height: 20),
                  Custombuttonauth(
                    text: "36".tr,
                    onPressed: () {
                      controller.goToSuccessResetPassword();
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
