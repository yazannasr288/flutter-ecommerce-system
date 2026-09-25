import 'package:admin/controller/orders/acceptedcontroller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../widget/order/orderslistcardaccepted.dart';

class Accepted extends StatelessWidget {
  const Accepted({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Acceptedcontroller());

    return Padding(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<Acceptedcontroller>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.offlinefailuer ||
              controller.statusRequest == StatusRequest.failure) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Handlingdataview(
                    statusRequest: controller.statusRequest,
                    widget: const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: controller.refreshData,
                    child: Text('272'.tr),
                  ),
                ],
              ),
            );
          }

          if (controller.statusRequest == StatusRequest.loading) {
            return Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: const SizedBox.shrink(),
            );
          }

          return RefreshIndicator(
            onRefresh: controller.refreshData,
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) => Orderslistcardaccepted(
                listdata: controller.data[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
