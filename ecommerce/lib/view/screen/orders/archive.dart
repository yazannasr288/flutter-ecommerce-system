import 'package:ecommerse/controler/orders/archivecontroller.dart';
import 'package:ecommerse/view/widget/order/orderslistcardarchive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/handlingdataview.dart';

class Archive extends StatelessWidget {
  const Archive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Archivecontroller());
    return Scaffold(
      appBar: AppBar(title: Text("103".tr)),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<Archivecontroller>(
          builder:
              (controller) => Handlingdataview(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder:
              ((context, index) =>
                  Cardorderslistarchive(listdata: controller.data[index])),
            ),
          ),
        ),
      ),
    );
  }
}
