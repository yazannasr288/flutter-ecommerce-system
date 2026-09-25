import 'package:ecommerse/core/class/handlingdataview.dart';
import 'package:ecommerse/core/constant/color.dart';
import 'package:ecommerse/core/function/alertexit.dart';
import 'package:ecommerse/view/screen/auth/custombuttonauth.dart';
import 'package:ecommerse/view/widget/auth/custom_text_form_auth.dart .dart';
import 'package:ecommerse/view/widget/auth/custom_text_titlt_auth.dart';
import 'package:ecommerse/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controler/auth/signup_controller.dart';
import '../../../core/function/validinput.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.only(top: 25),
          child: Customtexttitltauth(
            texttr: "23".tr,

            themeSelector: (theme) => theme.headlineSmall!,
          ),
        ),
      ),
      // ignore: deprecated_member_use
      body:  WillPopScope(
              onWillPop: alertExit,
              child: GetBuilder<SignUpControllerImp>(
                builder: (controller)=> HandlingdataRequest(statusRequest: controller.statusRequest, widget:
                   Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
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
                            texttr: "26".tr,
                            themeSelector: (theme) => theme.headlineSmall!,
                          ),
                        ),
                        SizedBox(height: 70),

                        Customtextformauth(
                          valid: (val) {
                            return validInput(val!, 1, 30, "username");
                          },
                          isnumber: false,
                          hinttext: "20".tr,
                          labletext: "19".tr,
                          iconData: Icons.person_2_outlined,
                          mycontroller: controller.username,
                        ),

                        Customtextformauth(
                          valid: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                          isnumber: false,
                          hinttext: "14".tr,
                          labletext: "12".tr,
                          iconData: Icons.email_outlined,
                          mycontroller: controller.email,
                        ),
                        GetBuilder<SignUpControllerImp>(builder: (contoller)=>
                           Customtextformauth(
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
                        Customtextformauth(
                          valid: (val) {
                            return validInput(val!, 8, 15, "phone");
                          },
                          isnumber: true,
                          hinttext: "22".tr,
                          labletext: "21".tr,
                          iconData: Icons.phone_android_outlined,
                          mycontroller: controller.phone,
                        ),

                        SizedBox(height: 20),
                        Custombuttonauth(
                          text: "18".tr,
                          onPressed: () {
                            controller.signUp();
                          },
                        ),
                        SizedBox(height: 10),
                        CustomTextSignupOrSignup(
                          textone: Customtexttitltauth(
                            texttr: "24".tr,
                            style: TextStyle(fontSize: 18),
                          ),
                          textwo: Customtexttitltauth(
                            texttr: "25".tr,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          ontap: controller.goToSignIn,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

    ));
  }
}
