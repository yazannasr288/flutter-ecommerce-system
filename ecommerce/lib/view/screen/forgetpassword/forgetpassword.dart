import 'package:ecommerse/controler/forgetpassword/forgetpasswordcontroller.dart';
import 'package:ecommerse/core/class/handlingdataview.dart';
import 'package:ecommerse/view/screen/auth/custombuttonauth.dart';
import 'package:ecommerse/view/widget/auth/custom_text_form_auth.dart .dart';
import 'package:ecommerse/view/widget/auth/custom_text_titlt_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
      ForgetpasswordcontrollerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.only(top: 25),
          child: Customtexttitltauth(
            texttr: "16".tr,

            themeSelector: (theme) => theme.headlineSmall!,
          ),
        ),
      ),
      body: GetBuilder<ForgetpasswordcontrollerImp>(builder: (controller)=>
      HandlingdataRequest(statusRequest: controller.statusRequest, widget
         :Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                SizedBox(height: 25),
                Customtexttitltauth(
                  texttr: "27".tr,
                  themeSelector: (theme) => theme.headlineMedium!,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Customtexttitltauth(
                    texttr: "31".tr,
                    themeSelector: (theme) => theme.headlineSmall!,
                  ),
                ),
                SizedBox(height: 70),

                Customtextformauth(
                  valid: (val){return;},
                  isnumber: false,
                  hinttext: "14".tr,
                  labletext: "12".tr,
                  iconData: Icons.email_outlined,
                  mycontroller: controller.email,
                ),

                SizedBox(height: 20),
                Custombuttonauth(
                  text: "28".tr,
                  onPressed: () {
                    controller.checkemail();
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
