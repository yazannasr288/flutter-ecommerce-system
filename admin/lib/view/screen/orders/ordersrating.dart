import 'package:admin/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/detailscontroller.dart';

class Ordersrating extends StatelessWidget {
  const Ordersrating({super.key});

  @override
  Widget build(BuildContext context) {
    Ordersdetailscontroller controller = Get.put(Ordersdetailscontroller());
    return Scaffold(
      appBar: AppBar(title: Text('التقييم'.tr)),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<Ordersdetailscontroller>(
          builder: (controller) => Handlingdataview(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "رقم الطلب".tr,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Spacer(),
                            Text(
                              "${controller.ordersModel.ordersId}\$",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Text(
                              "عدد النجوم".tr,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Spacer(),
                            Text(
                              "${controller.ordersModel.ordersRating}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "الملاحظات".tr,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Spacer(),
                            Expanded(
                              flex: 5,
                              child: Text(
                                controller.ordersModel.ordersNoterating ?? "",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
