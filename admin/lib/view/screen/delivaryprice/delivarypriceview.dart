// ignore_for_file: deprecated_member_use
import 'package:admin/controller/delivarypricecontroller/viewcontroller.dart';

import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Delivarypriceview extends StatelessWidget {
  const Delivarypriceview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DelivarypriceViewcontroller());
    return Scaffold(
      appBar: AppBar(title: Text("264".tr)),
      body: GetBuilder<DelivarypriceViewcontroller>(
        builder: (controller) => Handlingdataview(
          statusRequest: controller.statusRequest,
          widget: WillPopScope(
            onWillPop: () => controller.myback(),
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                final item = controller.data[index];
                return InkWell(
                  onTap: () => controller.gotopageedit(item),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                        child: Row(
                          children: [
                            Text(
                              "264".tr,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryColor,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              item.delivaryprice ?? '',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
