import 'package:ecommerse/controler/favoritcontroller.dart';
import 'package:ecommerse/controler/itemscontroller.dart';
import 'package:ecommerse/core/class/handlingdataview.dart';
import 'package:ecommerse/data/model/itemsmodel.dart';
import 'package:ecommerse/view/widget/items/Listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../widget/customappbar.dart';
import '../widget/items/customlistitems.dart';
import 'home.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemscontrollerImp controller = Get.put(ItemscontrollerImp());
    Favoritcontroller controllerfav = Get.put(Favoritcontroller());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Customappbar(
              titleappbar: "55".tr,
              onPressediconsearch: () {
                controller.onSearchitems();
              },
              onPressediconfavorite: () {
                Get.toNamed(AppRoutes.myfavorite);
              },
              mycontroller: controller.search!,
              onChanged: (val) {
                controller.checkSearch(val);
              }, onPressedicondelete: () {controller.search!.clear();  },
            ),
            SizedBox(height: 20),
            Listcategoriesitems(),
            GetBuilder<ItemscontrollerImp>(
              builder:
                  (controller) => Handlingdataview(
                    statusRequest: controller.statusRequest,
                    widget:
                        !controller.isSearch
                            ? GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.data.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.7,
                                  ),
                              itemBuilder: (BuildContext context, index) {
                                controllerfav.isFavorite[controller
                                        .data[index]['items_id']] =
                                    controller.data[index]['favorite'];
                                return Customlistitems(
                                  itemsModel: ItemsModel.fromJson(
                                    controller.data[index],
                                  ),
                                );
                              },
                            )
                            : ListitemsSearch(
                              listdatamodel: controller.listdata,
                            ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
