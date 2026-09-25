import 'package:admin/controller/offers/addcontroller.dart';
import 'package:admin/core/class/handlingdataview.dart';

import 'package:admin/core/shared/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Offeradd extends StatelessWidget {
  const Offeradd({super.key});

  @override
  Widget build(BuildContext context) {
    final OfferAddcontroller controller = Get.put(OfferAddcontroller());
    return Scaffold(
      appBar: AppBar(title: Text("269".tr)),
      body: GetBuilder<OfferAddcontroller>(
        builder: (_) => Handlingdataview(
          statusRequest: controller.statusRequest,
          widget: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent,
                      ),
                      onPressed: controller.showoptionImage,
                      child: Text(
                        "271".tr,
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
                      child: Image.file(controller.file!),
                    ),
                  const SizedBox(height: 20),
                  if (controller.file != null)
                    Custombutton(
                      text: "196".tr,
                      onPressed: controller.addData,
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
