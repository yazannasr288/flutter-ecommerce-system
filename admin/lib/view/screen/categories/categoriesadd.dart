import 'package:admin/controller/categories/addcontroller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/function/validinput.dart';
import 'package:admin/core/shared/Customtextformglobal.dart';
import 'package:admin/core/shared/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Categoriesadd extends StatelessWidget {
  const Categoriesadd({super.key});

  @override
  Widget build(BuildContext context) {
    final CatAddcontroller controller = Get.put(CatAddcontroller());
    return Scaffold(
      appBar: AppBar(title: Text("192".tr)),
      body: GetBuilder<CatAddcontroller>(
        builder: (controller) => Handlingdataview(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  Customtextformglobal(
                    hinttext: "193".tr,
                    labletext: "193".tr,
                    iconData: Icons.category,
                    mycontroller: controller.name,
                    valid: (val) {
                      return validInput(val!, 1, 30, "");
                    },
                    isnumber: false,
                  ),
                  Customtextformglobal(
                    hinttext: "194".tr,
                    labletext: "194".tr,
                    iconData: Icons.category,
                    mycontroller: controller.namear,
                    valid: (val) {
                      return validInput(val!, 1, 30, "");
                    },
                    isnumber: false,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent,
                      ),
                      onPressed: () {
                        controller.chooseimage();
                      },
                      child: Text(
                        "195".tr,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (controller.file != null)
                    SizedBox(
                      height: 70,
                      child: SvgPicture.file(controller.file!),
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
