import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/function/validinput.dart';
import 'package:admin/core/shared/Customtextformglobal.dart';
import 'package:admin/core/shared/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/copon/editcontroller.dart';

class Coponedit extends StatelessWidget {
  const Coponedit({super.key});

  @override
  Widget build(BuildContext context) {
    CoponEditcontroller controller = Get.put(CoponEditcontroller());
    return Scaffold(
      appBar: AppBar(title: Text("262".tr)),
      body: GetBuilder<CoponEditcontroller>(
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
                    hinttext: "258".tr,
                    labletext: "258".tr,
                    iconData: Icons.drive_file_rename_outline,
                    mycontroller: controller.coponname,
                    valid: (val) {
                      return validInput(val!, 1, 30, "");
                    },
                    isnumber: false,
                  ),
                  Customtextformglobal(
                    hinttext: "259".tr,
                    labletext: "259".tr,
                    iconData: Icons.format_list_numbered,
                    mycontroller: controller.coponcount,
                    valid: (val) {
                      return validInput(val!, 1, 100, "");
                    },
                    isnumber: true,
                  ),
                  Customtextformglobal(
                    hinttext: "260".tr,
                    labletext: "260".tr,
                    iconData: Icons.discount,
                    mycontroller: controller.copondiscount,
                    valid: (val) {
                      return validInput(val!, 1, 500, "");
                    },
                    isnumber: true,
                  ),
                  Customtextformglobal(
                    read: true,
                    hinttext: "261".tr,
                    labletext: "261".tr,
                    iconData: Icons.date_range,
                    onTapIcon: () => controller.selectDate(context),
                    mycontroller: controller.copondate,
                    valid: (val) {
                      return validInput(val!, 1, 500, "");
                    },
                    isnumber: true,
                  ),
                  const SizedBox(height: 20),
                  Custombutton(
                    text: "201".tr,
                    onPressed: () {
                      controller.editData();
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
