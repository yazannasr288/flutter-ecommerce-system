import 'package:ecommerse/controler/favoritcontroller.dart';
import 'package:ecommerse/controler/offercontroller.dart';
import 'package:ecommerse/core/class/handlingdataview.dart';
import 'package:ecommerse/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../widget/customappbar.dart';
import '../widget/offer/cutomlistitemsoffer.dart';

class Offer extends StatelessWidget {
  const Offer({super.key});

  @override
  Widget build(BuildContext context) {
    Offercontroller controller = Get.put(Offercontroller());
    Favoritcontroller controllerfav = Get.put(Favoritcontroller());
    return GetBuilder<Offercontroller>(
      builder:
          (controller) => Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                Customappbar(
                  mycontroller: controller.search!,
                  titleappbar: "55".tr,
                  onPressedicondelete: () {controller.onDeleteSearch();},
                  onPressediconsearch: () {
                    controller.onSearchitems();
                  },
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                  onPressediconfavorite: () {
                    Get.toNamed(AppRoutes.myfavorite);
                  },

                ),
                SizedBox(height: 10),
                !controller.isSearch
                    ? Handlingdataview(
                      statusRequest: controller.statusRequest,
                      widget: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.data.length,
                        itemBuilder:
                            (context, index) => Customlistitemsoffer(
                              itemsModel: controller.data[index],
                            ),
                      ),
                    )
                    : ListitemsSearch(listdatamodel: controller.listdata),
              ],
            ),
          ),
    );
  }
}
