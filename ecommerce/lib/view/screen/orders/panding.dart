import 'package:ecommerse/controler/orders/pandingcontroller.dart';
import 'package:ecommerse/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/order/orderslistcard.dart';

class Panding extends StatelessWidget {
  const Panding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Pandingcontroller());
    return Scaffold(
      appBar: AppBar(title: Text("110".tr)),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<Pandingcontroller>(
          builder:
              (controller) => Handlingdataview(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder:
                      ((context, index) =>
                          Cardorderslist(listdata: controller.data[index])),
                ),
              ),
        ),
      ),
    );
  }
}


