import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/view/screen/auth/custombuttonauth.dart';
import 'package:admin/view/widget/auth/custom_text_titlt_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/forgetpassword/forgetpasswordcontroller.dart';
import '../../widget/auth/custom_text_form_auth.dart .dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetpasswordcontrollerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.only(top: 25),
          child: Customtexttitltauth(
            texttr: "16".tr,
            themeSelector: (theme) => theme.headlineSmall!,
          ),
        ),
      ),
      body: GetBuilder<ForgetpasswordcontrollerImp>(
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
                    texttr: "27".tr,
                    themeSelector: (theme) => theme.headlineMedium!,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Customtexttitltauth(
                      texttr: "31".tr,
                      themeSelector: (theme) => theme.headlineSmall!,
                    ),
                  ),
                  const SizedBox(height: 70),
                  Customtextformauth(
                    valid: (val) => val != null && val.contains('@')
                        ? null
                        : "Please enter a valid email",
                    isnumber: false,
                    hinttext: "14".tr,
                    labletext: "12".tr,
                    iconData: Icons.email_outlined,
                    mycontroller: controller.email,
                  ),
                  const SizedBox(height: 20),
                  Custombuttonauth(
                    text: "28".tr,
                    onPressed: () {
                      controller.checkemail();
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
