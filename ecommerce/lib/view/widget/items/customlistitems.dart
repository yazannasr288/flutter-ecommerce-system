import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerse/controler/favoritcontroller.dart';
import 'package:ecommerse/controler/itemscontroller.dart';
import 'package:ecommerse/core/constant/imageassete.dart';
import 'package:ecommerse/core/function/translatedatabase.dart';
import 'package:ecommerse/data/model/itemsmodel.dart';
import 'package:ecommerse/view/widget/priceline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class Customlistitems extends GetView<ItemscontrollerImp> {
  final ItemsModel itemsModel;

  const Customlistitems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotopageproductdetails(itemsModel);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Icon(Icons.time_to_leave_outlined),
                  SizedBox(width: 4),
                  Text("${controller.delivarytime}"),
                  Text("-${controller.delivarytimeextra} "),
                  Text("139".tr),
                  Spacer(),
                  Row(
                    children: [
                      if (itemsModel.itemsDiscount != "0")
                        Image.asset(
                          AppImageAssets.sale,
                          width: 20,
                        ),
                      if (itemsModel.itemsDiscount != "0")
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                          ),

                          child: Text(
                            "%${itemsModel.itemsDiscount}",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${itemsModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          AppLink.imagestItems + "/" + itemsModel.itemsImage!,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    translateDatabase(
                      itemsModel.itemsNameAr,
                      itemsModel.itemsName,
                    ),
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    translateDatabase(
                      itemsModel.itemsDescAr,

                      itemsModel.itemsDesc,
                    ),
                    style: TextStyle(color: Colors.grey[800], fontSize: 14),
                  ),
                  SizedBox(height: 3),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [Text("rating 3.5", textAlign: TextAlign.center)],
                  // ),
                  // Container(
                  //   height: 22,
                  //   alignment: Alignment.bottomCenter,
                  //
                  //   child: Row(
                  //     children: [
                  //       ...List.generate(
                  //         5,
                  //         (index) => Icon(Icons.star_border_outlined, size: 15),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Priceline(
                        price:
                            (int.tryParse(
                                          itemsModel.itemsDiscount.toString(),
                                        ) ??
                                        0) >
                                    0
                                ? Column(
                                  children: [
                                    Text(
                                      "\$ ${itemsModel.itemsPrice}",
                                      style: TextStyle(
                                        color: Colors.red,
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "\$ ${itemsModel.itemspricediscount}",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                )
                                : Text(
                                  "\$ ${itemsModel.itemsPrice}",
                                  style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                      ),
                      // )               ,       Text(
                      //   "${itemsModel.itemspricediscount}\$",
                      //   style: TextStyle(
                      //     color: Colors.green,
                      //     fontFamily: "sans",
                      //   ),
                      // ),
                      GetBuilder<Favoritcontroller>(
                        builder:
                            (controller) => IconButton(
                              onPressed: () {
                                if (controller.isFavorite[itemsModel.itemsId] ==
                                    "1") {
                                  controller.setFavorite(
                                    itemsModel.itemsId,
                                    "0",
                                  );
                                  controller.removeFavorite(
                                    itemsModel.itemsId!,
                                  );
                                } else {
                                  controller.setFavorite(
                                    itemsModel.itemsId,
                                    "1",
                                  );
                                  controller.addFavorite(itemsModel.itemsId!);
                                }
                              },
                              icon: Icon(
                                color: Colors.red,
                                controller.isFavorite[itemsModel.itemsId] == "1"
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                              ),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
