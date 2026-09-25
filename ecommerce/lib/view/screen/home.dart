import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerse/controler/homecontroller.dart';
import 'package:ecommerse/core/class/handlingdataview.dart';
import 'package:ecommerse/core/constant/routes.dart';
import 'package:ecommerse/data/model/itemsmodel.dart';
import 'package:ecommerse/linkapi.dart';
import 'package:ecommerse/view/widget/customappbar.dart';
import 'package:ecommerse/view/widget/home/customsurpricehome.dart';
import 'package:ecommerse/view/widget/home/customtitlehome.dart';
import 'package:ecommerse/view/widget/home/listcategorieshome.dart';
import 'package:ecommerse/view/widget/home/listitemshome.dart';
import 'package:ecommerse/view/widget/priceline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../widget/home/listitemshomebest.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    HomecontrollerImp controller = Get.put(HomecontrollerImp());

    return GetBuilder<HomecontrollerImp>(
      builder:
          (controller) => Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: ListView(
              children: [
                Customappbar(
                  mycontroller: controller.search!,
                  titleappbar: "55".tr,
                  onPressediconsearch: () {
                    controller.onSearchitems();
                  },
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                  onPressediconfavorite: () {
                    Get.toNamed(AppRoutes.myfavorite);
                  },
                  onPressedicondelete: () {
                    controller.onDeleteSearch();
                  },
                ),
                Handlingdataview(
                  statusRequest: controller.statusRequest,
                  widget:
                      !controller.isSearch
                          ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // if (controller.offersdata.isNotEmpty)
                              Customsurpricehome(
                                image:
                                    controller.offerimage != null &&
                                            controller.offerimage != ""
                                        ? Image.network(
                                          "${AppLink.imageoffers}/${controller.offerimage}",
                                        )
                                        : Image.asset(
                                          "assets/images/errorimage.png",
                                        ),
                              ),
                              // Customcardhome(title: "56".tr, body: "57".tr),
                              Customtitlehome(title: "59".tr),
                              Listcategorieshome(),
                              Customtitlehome(title: "58".tr),
                              Listitemshome(),
                              Customtitlehome(title: "62".tr),
                              Listitemshomebest(),
                            ],
                          )
                          : ListitemsSearch(listdatamodel: controller.listdata),
                ),
              ],
            ),
          ),
    );
  }
}

class ListitemsSearch extends GetView<HomecontrollerImp> {
  final List<ItemsModel> listdatamodel;

  const ListitemsSearch({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listdatamodel.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.gotopageproductdetails(listdatamodel[index]);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 2),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imagestItems}/${listdatamodel[index].itemsImage}",
                        height: 90,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text(
                          listdatamodel[index].itemsName!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(listdatamodel[index].itemsDesc!),
                      ),
                    ),
                    Priceline(
                      price:
                          (int.tryParse(
                                        listdatamodel[index].itemsDiscount
                                            .toString(),
                                      ) ??
                                      0) >
                                  0
                              ? Column(
                                children: [
                                  Text(
                                    "\$ ${listdatamodel[index].itemsPrice}",
                                    style: TextStyle(
                                      color: Colors.red,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "\$ ${listdatamodel[index].itemspricediscount}",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              )
                              : Text(
                                "\$ ${listdatamodel[index].itemsPrice}",
                                style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
