// ignore_for_file: deprecated_member_use
import 'package:admin/controller/copon/viewcontroller.dart';

import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Coponview extends StatelessWidget {
  const Coponview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CoponViewcontroller());
    return Scaffold(
      appBar: AppBar(title: Text("257".tr)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.coponadd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<CoponViewcontroller>(
        builder: (controller) => Handlingdataview(
          statusRequest: controller.statusRequest,
          widget: WillPopScope(
            onWillPop: () {
              return controller.myback();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.gotopageedit(controller.data[index]);
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "258".tr,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.data[index].coponName!,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                        "259".tr,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.data[index].coponCount!,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                        "260".tr,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.data[index].coponDiscount!,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                        "261".tr,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.data[index].copondate!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  const Divider(),
                                  IconButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                        title: "63".tr,
                                        middleText: "233".tr,
                                        onCancel: () {},
                                        onConfirm: () {
                                          controller.deletecopon(
                                            controller.data[index].coponId!,
                                          );
                                          Get.back();
                                        },
                                      );
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
