import 'package:ecommerse/core/constant/color.dart';
import 'package:ecommerse/core/function/alertexit.dart';
import 'package:ecommerse/core/function/validinput.dart';
import 'package:ecommerse/view/screen/auth/custombuttonauth.dart';
import 'package:ecommerse/view/widget/auth/custom_text_form_auth.dart .dart';
import 'package:ecommerse/view/widget/auth/custom_text_titlt_auth.dart';
import 'package:ecommerse/view/widget/auth/logoauth.dart';
import 'package:ecommerse/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controler/auth/login_controller.dart';
import '../../../core/class/handlingdataview.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp contoller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title:  Container(
                padding: EdgeInsets.only(top: 25),
                child: Customtexttitltauth(
                  texttr: "10".tr,

                  themeSelector: (theme) => theme.headlineSmall!,
                ),
              ),
        ),

      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: alertExit,
        child : GetBuilder<LoginControllerImp>(
          builder:
          (controller) =>HandlingdataRequest(statusRequest: controller.statusRequest,
      widget : Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: contoller.formstate,
              child: ListView(
                children: [
                  Logoauth(),
                  SizedBox(height: 25),
                  Customtexttitltauth(
                    texttr: "2".tr,
                    themeSelector: (theme) => theme.headlineMedium!,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Customtexttitltauth(
                      texttr: "11".tr,
                      themeSelector: (theme) => theme.headlineSmall!,
                    ),
                  ),
                  SizedBox(height: 70),
                  Customtextformauth(
                    valid: (val) {
                      return validInput(val!, 5, 100, "email");
                    },
                    isnumber: false,
                    hinttext: "14".tr,
                    labletext: "12".tr,
                    iconData: Icons.email_outlined,
                    mycontroller: contoller.email,
                  ),
                  GetBuilder<LoginControllerImp>(
                    builder:
                        (contoller) => Customtextformauth(
                          obsecure: contoller.isshowpassword,
                          onTapIcon: () {
                            contoller.showpassword();
                          },

                          valid: (val) {
                            return validInput(val!, 8, 50, "password");
                          },
                          isnumber: false,
                          hinttext: "15".tr,
                          labletext: "13".tr,
                          iconData: Icons.lock_clock_outlined,
                          mycontroller: contoller.password,
                        ),
                  ),
                  InkWell(
                    onTap: () {
                      contoller.goToForgetPassword();
                    },
                    child: Customtexttitltauth(
                      texttr: "16".tr,
                      textAlign: TextAlign.end,
                      themeSelector: (theme) => theme.headlineMedium,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),

                  SizedBox(height: 20),

                  Custombuttonauth(
                    text: "25".tr,
                    onPressed: () {
                      contoller.login();
                    },
                  ),
                  SizedBox(height: 10),
                  CustomTextSignupOrSignup(
                    textone: Customtexttitltauth(
                      texttr: "17".tr,
                      style: TextStyle(fontSize: 18),
                    ),

                    textwo: Customtexttitltauth(
                      texttr: "18".tr,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    ontap: contoller.goToSignUp,
                  ),
                ],)
              ),
            ),
        ),
        ),
      ),
    );
  }
}
