import 'package:ecommerse/controler/auth/updatedetailsusercontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/handlingdataview.dart';
import '../../../core/function/validinput.dart';
import '../../../core/shared/custombutton.dart';
import '../../widget/Customtextformglobal.dart';

class Edituserdetails extends StatelessWidget {
  const Edituserdetails({super.key});

  @override
  Widget build(BuildContext context) {
    final UpdateusersdetailsController controller = Get.put(
      UpdateusersdetailsController(),
    );
    return Scaffold(
      appBar: AppBar(title: Text("199".tr)),
      body: GetBuilder<UpdateusersdetailsController>(
        builder: (controller) => Handlingdataview(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  const SizedBox(height: 10),
                  Customtextformglobal(
                    hinttext: "19".tr,
                    labletext: "20".tr,
                    iconData: Icons.person,
                    mycontroller: controller.username,
                    valid: (val) => validInput(val!, 2, 30, ""),
                    isnumber: false,
                  ),
                  const SizedBox(height: 15),
                  Customtextformglobal(
                    hinttext: "21".tr,
                    labletext: "22".tr,
                    iconData: Icons.phone,
                    mycontroller: controller.phone,
                    valid: (val) => validInput(val!, 9, 12, ""),
                    isnumber: true,
                  ),
                  const SizedBox(height: 20),
                  Custombutton(
                    text: "95".tr,
                    onPressed: controller.editData,
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
