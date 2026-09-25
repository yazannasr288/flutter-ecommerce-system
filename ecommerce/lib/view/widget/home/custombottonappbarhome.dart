import 'package:ecommerse/controler/homescreencontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custombottonappbar.dart';

class Custombottonappbarhome extends StatelessWidget {
  const Custombottonappbarhome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomescreencontrollerImp>(
      builder: (controller)=>
      BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(controller.listpage.length + 1, ((index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? Spacer()
                  : Custombottonappbar(
                textbutton: controller.buttonappbar[i]['title'],
                iconData: controller.buttonappbar[i]['icons'],
                onPressed: () {
                  controller.changePage(i);
                },
                active: controller.currentPage == i ? true : false,
              );
            })),
          ],
        ),
      ),
    );
  }
}
