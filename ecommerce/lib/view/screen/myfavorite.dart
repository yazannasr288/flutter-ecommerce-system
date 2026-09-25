import 'package:ecommerse/controler/myfavoritecontroller.dart';
import 'package:ecommerse/view/widget/myfavorite/customlistfavoriteitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/handlingdataview.dart';

class Myfavorite extends StatelessWidget {
  const Myfavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoritcontroller());
    return Scaffold(appBar: AppBar(title: Text("121".tr),),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoritcontroller>(
          builder:
              (controller) => ListView(
                children: [
                  // Customappbar(
                  //   titleappbar: "55".tr,
                  //   onPressediconsearch: () {},
                  //   onPressediconfavorite: () {
                  //     Get.toNamed(AppRoutes.myfavorite);
                  //   },
                  // ),
                  SizedBox(height:20 ,),
                  Handlingdataview(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,childAspectRatio: 0.7
                      ),
                      itemBuilder: (context, index) {
                        return Customlistifavorittems(itemsModel: controller.data[index]);
                      },
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
