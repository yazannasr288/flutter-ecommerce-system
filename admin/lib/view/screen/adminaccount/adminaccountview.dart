// ignore_for_file: deprecated_member_use
import 'package:admin/controller/adminaccount/viewcontroller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Adminaccountview extends StatelessWidget {
  const Adminaccountview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminViewcontroller());
    return Scaffold(
      appBar: AppBar(title: Text("242".tr)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.adminaccountadd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<AdminViewcontroller>(
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
                                        "243".tr,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.data[index].name!,
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
                                        "229".tr,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.data[index].email!,
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
                                        "230".tr,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.data[index].password!,
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
                                        "231".tr,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.data[index].phone!,
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
                                        "232".tr,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "${controller.printorderstatus(controller.data[index].aproove!)}",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  IconButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                        title: "63".tr,
                                        middleText: "233".tr,
                                        onCancel: () {},
                                        onConfirm: () {
                                          controller.deleteadmin(
                                            controller.data[index].id!,
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
