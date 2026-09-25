import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/homescreencontroller.dart';
import 'custombottonappbar.dart';

class Custombottonappbarhome extends StatelessWidget {
  const Custombottonappbarhome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomescreencontrollerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: List.generate(
            controller.listpage.length,
                (index) => Expanded(
              child: Custombottonappbar(
                textbutton: controller.buttonappbar[index]['title'],
                iconData: controller.buttonappbar[index]['icons'],
                onPressed: () => controller.changePage(index),
                active: controller.currentPage == index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
