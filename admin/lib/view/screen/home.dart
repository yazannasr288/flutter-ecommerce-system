import 'package:admin/core/constant/imageassete.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/alertexit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../controller/homecontroller.dart';
import '../../core/services/services.dart';
import '../widget/home/cardadmin.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    HomecontrollerImp controller = Get.put(HomecontrollerImp());
    final MyServices myServices = Get.find();


    return Scaffold(
      appBar: AppBar(
        title: Text("221".tr),
        leading: IconButton(
          onPressed: () {
            Get.toNamed(AppRoutes.languageinapp);
          },
          icon: const Icon(Icons.translate),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                title: "63".tr,
                middleText: "202".tr,
                onCancel: () {},
                onConfirm: () {
                  controller.logut();
                  Get.back();
                },
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: alertExit,
        child: ListView(
          children: [
            GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: getValueForScreenType(
                  context: context,
                  mobile: 2,
                  tablet: 5,
                  desktop: 6,
                ),
                mainAxisExtent: 150,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                Cardadmin(
                  title: "203".tr,
                  url: AppImageAssets.appicon,
                  onclick: () {
                    Get.toNamed(AppRoutes.categoriesView);
                  },
                ),
                Cardadmin(
                  title: "217".tr,
                  url: AppImageAssets.appicon,
                  onclick: () {
                    Get.toNamed(AppRoutes.itemsview);
                  },
                ),
                Cardadmin(
                  title: "218".tr,
                  url: AppImageAssets.appicon,
                  onclick: () {
                    Get.toNamed(AppRoutes.orderscreen);
                  },
                ),
                Cardadmin(
                  title: "226".tr,
                  url: AppImageAssets.appicon,
                  onclick: () {
                    Get.toNamed(AppRoutes.offerview);
                  },
                ),
                Cardadmin(
                  title: "227".tr,
                  url: AppImageAssets.appicon,
                  onclick: () {
                    Get.toNamed(AppRoutes.delivaryaccountview);
                  },
                ),
                if (myServices.sharedPreferences.getString("email")?.contains("287") == true)
                Cardadmin(
                  title: "242".tr,
                  url: AppImageAssets.appicon,
                  onclick: () {
                    Get.toNamed(AppRoutes.adminaccountview);
                  },
                ),
                Cardadmin(
                  title: "246".tr,
                  url: AppImageAssets.appicon,
                  onclick: () {
                    Get.toNamed(AppRoutes.notofication);
                  },
                ),
                Cardadmin(
                  title: "257".tr,
                  url: AppImageAssets.appicon,
                  onclick: () {
                    Get.toNamed(AppRoutes.coponview);
                  },
                ),
                Cardadmin(
                  title: "264".tr,
                  url: AppImageAssets.appicon,
                  onclick: () {
                    Get.toNamed(AppRoutes.delivaryview);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
