import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/ordercontroller.dart';
import '../home/custombottonappbar.dart';

class Custombottonappbarhome extends StatelessWidget {
  const Custombottonappbarhome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdercontrollerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: List.generate(
            controller.listpage.length,
                (index) => Expanded(
              child: Custombottonappbar(
                textbutton: controller.buttonappbar[index]['title'] as String,
                iconData: controller.buttonappbar[index]['icons'] as IconData,
                onPressed: () {
                  controller.changePage(index);
                },
                active: controller.currentPage == index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
