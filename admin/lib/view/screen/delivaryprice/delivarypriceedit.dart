import 'package:admin/controller/delivarypricecontroller/editcontroller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/function/validinput.dart';
import 'package:admin/core/shared/Customtextformglobal.dart';
import 'package:admin/core/shared/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Delivarypriceedit extends StatelessWidget {
  const Delivarypriceedit({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Delivarypriceeditcontroller());
    return Scaffold(
      appBar: AppBar(title: Text("265".tr)),
      body: GetBuilder<Delivarypriceeditcontroller>(
        builder: (controller) => Handlingdataview(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Customtextformglobal(
                      hinttext: "264".tr,
                      labletext: "264".tr,
                      iconData: Icons.delivery_dining,
                      mycontroller: controller.delivaryprice,
                      valid: (val) => validInput(val!, 1, 30, ""),
                      isnumber: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Custombutton(
                    text: "201".tr,
                    onPressed: () => controller.editData(),
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
