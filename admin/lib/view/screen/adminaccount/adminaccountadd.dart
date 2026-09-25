import 'package:admin/controller/adminaccount/addcontroller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/function/validinput.dart';
import 'package:admin/core/shared/Customtextformglobal.dart';
import 'package:admin/core/shared/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Adminaccountadd extends StatelessWidget {
  const Adminaccountadd({super.key});

  @override
  Widget build(BuildContext context) {
    AdminAddcontroller controller = Get.put(AdminAddcontroller());
    return Scaffold(
      appBar: AppBar(title: Text("245".tr)),
      body: GetBuilder<AdminAddcontroller>(
        builder: (controller) => Handlingdataview(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: SizedBox(), // تم استبداله مؤقتًا لتطبيق const
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Customtextformglobal(
                      hinttext: "237".tr,
                      labletext: "237".tr,
                      iconData: Icons.person,
                      mycontroller: controller.username,
                      valid: (val) {
                        return validInput(val!, 1, 100, "");
                      },
                      isnumber: false,
                    ),
                  ),
                  Customtextformglobal(
                    hinttext: "238".tr,
                    labletext: "238".tr,
                    iconData: Icons.email,
                    mycontroller: controller.email,
                    valid: (val) {
                      return validInput(val!, 1, 100, "");
                    },
                    isnumber: false,
                  ),
                  Customtextformglobal(
                    hinttext: "239".tr,
                    labletext: "239".tr,
                    iconData: Icons.password,
                    mycontroller: controller.password,
                    valid: (val) {
                      return validInput(val!, 1, 500, "");
                    },
                    isnumber: false,
                  ),
                  Customtextformglobal(
                    hinttext: "240".tr,
                    labletext: "240".tr,
                    iconData: Icons.phone,
                    mycontroller: controller.phone,
                    valid: (val) {
                      return validInput(val!, 1, 500, "");
                    },
                    isnumber: true,
                  ),
                  const SizedBox(height: 20),
                  Custombutton(
                    text: "196".tr,
                    onPressed: () {
                      controller.addData();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
