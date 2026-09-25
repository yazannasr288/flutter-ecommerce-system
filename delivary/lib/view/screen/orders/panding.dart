import 'package:delivary/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/pandingcontroller.dart';
import '../../../core/class/statusrequest.dart';
import '../../widget/order/orderslistcardpanding.dart';

class Panding extends StatelessWidget {
  const Panding({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Pandingcontroller());

    return Container(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<Pandingcontroller>(
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
                    onPressed: () {
                      controller.refreshData();
                    },
                    child: Text('196'.tr),
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
            onRefresh: () async {
              await controller.refreshData();
            },
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) =>
                  Cardorderslist(listdata: controller.data[index]),
            ),
          );
        },
      ),
    );
  }
}
