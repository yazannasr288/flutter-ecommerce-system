import 'package:admin/view/widget/order/orderslistcardarchive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/archivecontroller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/class/statusrequest.dart';

class Archive extends StatelessWidget {
  const Archive({super.key});

  @override
  Widget build(BuildContext context) {
    final Archivecontroller controller = Get.put(Archivecontroller());

    return Container(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<Archivecontroller>(
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
                  const _RefreshButton(), // استخراج الزر إلى Widget ثابت لتحسين الأداء
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
              itemBuilder: (context, index) => Cardorderslistarchive(
                listdata: controller.data[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _RefreshButton extends StatelessWidget {
  const _RefreshButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.find<Archivecontroller>().refreshData();
      },
      child: const Text('تحديث البيانات'),
    );
  }
}
