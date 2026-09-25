import 'package:admin/controller/delivaryaccount/viewcontroller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Delivaryaccountview extends StatelessWidget {
  const Delivaryaccountview({super.key});

  Widget _buildInfoRow(String label, String value) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
            const Spacer(),
            Text(
              value,
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(DelivaryViewcontroller());
    return Scaffold(
      appBar: AppBar(title: Text("227".tr)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.delivaryaccountadd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<DelivaryViewcontroller>(
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
                  final item = controller.data[index];
                  return InkWell(
                    onTap: () {
                      controller.gotopageedit(item);
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            _buildInfoRow("228".tr, item.name!),
                            _buildInfoRow("229".tr, item.email!),
                            _buildInfoRow("230".tr, item.password!),
                            _buildInfoRow("231".tr, item.phone!),
                            _buildInfoRow(
                              "232".tr,
                              controller.printorderstatus(item.aproove!),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.defaultDialog(
                                  title: "63".tr,
                                  middleText: "233".tr,
                                  onCancel: () {},
                                  onConfirm: () {
                                    controller.deletedelivary(item.id!);
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
