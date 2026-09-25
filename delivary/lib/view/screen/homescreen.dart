import 'package:delivary/core/constant/routes.dart';
import 'package:delivary/core/function/alertexit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/homescreencontroller.dart';
import '../widget/home/custombottonappbarhome.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomescreencontrollerImp());
    return GetBuilder<HomescreencontrollerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text("187".tr),
          leading: IconButton(
            onPressed: () => Get.toNamed(AppRoutes.languageinapp),
            icon: const Icon(Icons.translate),
          ),
          actions: [
            IconButton(
              onPressed: controller.logut,
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        bottomNavigationBar: const Custombottonappbarhome(),
        body: WillPopScope(
          onWillPop: () {
            alertExit();
            return Future.value(false);
          },
          child: controller.listpage[controller.currentPage],
        ),
      ),
    );
  }
}
