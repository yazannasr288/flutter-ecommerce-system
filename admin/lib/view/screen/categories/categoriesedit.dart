import 'package:admin/controller/categories/editcontroller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/function/validinput.dart';
import 'package:admin/core/shared/Customtextformglobal.dart';
import 'package:admin/core/shared/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Categoriesedit extends StatelessWidget {
  const Categoriesedit({super.key});

  @override
  Widget build(BuildContext context) {
    final CatEditcontroller controller = Get.put(CatEditcontroller());
    return Scaffold(
      appBar: AppBar(title: Text("197".tr)),
      body: GetBuilder<CatEditcontroller>(
        builder: (controller) => Handlingdataview(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  Customtextformglobal(
                    hinttext: "198".tr,
                    labletext: "198".tr,
                    iconData: Icons.category,
                    mycontroller: controller.name,
                    valid: (val) => validInput(val!, 1, 30, ""),
                    isnumber: false,
                  ),
                  Customtextformglobal(
                    hinttext: "199".tr,
                    labletext: "199".tr,
                    iconData: Icons.category,
                    mycontroller: controller.namear,
                    valid: (val) => validInput(val!, 1, 30, ""),
                    isnumber: false,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent,
                      ),
                      onPressed: controller.chooseimage,
                      child: Text(
                        "200".tr,
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
                    text: "201".tr,
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
