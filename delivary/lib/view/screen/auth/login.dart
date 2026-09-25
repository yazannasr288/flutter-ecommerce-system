import 'package:delivary/core/constant/color.dart';
import 'package:delivary/core/function/alertexit.dart';
import 'package:delivary/core/function/validinput.dart';
import 'package:delivary/view/widget/auth/custombuttonauth.dart';
import 'package:delivary/view/widget/auth/custom_text_titlt_auth.dart';
import 'package:delivary/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/auth/custom_text_form_auth.dart .dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.only(top: 25),
          child: Customtexttitltauth(
            texttr: "10".tr,
            themeSelector: (theme) => theme.headlineSmall!,
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExit,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingdataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    const Logoauth(),
                    const SizedBox(height: 25),
                    Customtexttitltauth(
                      texttr: "2".tr,
                      themeSelector: (theme) => theme.headlineMedium!,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Customtexttitltauth(
                        texttr: "11".tr,
                        themeSelector: (theme) => theme.headlineSmall!,
                      ),
                    ),
                    const SizedBox(height: 70),
                    Customtextformauth(
                      valid: (val) => validInput(val!, 5, 100, "email"),
                      isnumber: false,
                      hinttext: "14".tr,
                      labletext: "12".tr,
                      iconData: Icons.email_outlined,
                      mycontroller: controller.email,
                    ),
                    GetBuilder<LoginControllerImp>(
                      builder: (controller) => Customtextformauth(
                        obsecure: controller.isshowpassword,
                        onTapIcon: controller.showpassword,
                        valid: (val) => validInput(val!, 8, 50, "password"),
                        isnumber: false,
                        hinttext: "15".tr,
                        labletext: "13".tr,
                        iconData: Icons.lock_clock_outlined,
                        mycontroller: controller.password,
                      ),
                    ),
                    InkWell(
                      onTap: controller.goToForgetPassword,
                      child: Customtexttitltauth(
                        texttr: "16".tr,
                        textAlign: TextAlign.end,
                        themeSelector: (theme) => theme.headlineMedium,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Custombuttonauth(
                      text: "25".tr,
                      onPressed: controller.login,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
