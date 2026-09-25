
import 'package:ecommerse/controler/homescreencontroller.dart';
import 'package:ecommerse/core/constant/color.dart';
import 'package:ecommerse/core/constant/routes.dart';
import 'package:ecommerse/core/function/alertexit.dart';
import 'package:ecommerse/view/widget/home/custombottonappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomescreencontrollerImp());
    return GetBuilder<HomescreencontrollerImp>(
      builder:
          (controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColor.primaryColor,
              onPressed: () {
                Get.toNamed(AppRoutes.cart);
              },
              child: Icon(Icons.shopping_basket_outlined),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Custombottonappbarhome(),
            body: WillPopScope(
              onWillPop: () {
               alertExit();
                return Future.value(false);
              },

              child: controller.listpage.elementAt(controller.currentPage),
            ),
          ),
    );
  }
}
