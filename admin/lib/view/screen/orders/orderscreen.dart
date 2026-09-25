import 'package:admin/core/function/alertexit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/ordercontroller.dart';
import '../../widget/order/custombottonappbarhome.dart';

class Orderscreen extends StatelessWidget {
  const Orderscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdercontrollerImp());
    return GetBuilder<OrdercontrollerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text("218".tr),
        ),
        bottomNavigationBar: const Custombottonappbarhome(),
        body: controller.listpage.elementAt(controller.currentPage),
      ),
    );
  }
}
