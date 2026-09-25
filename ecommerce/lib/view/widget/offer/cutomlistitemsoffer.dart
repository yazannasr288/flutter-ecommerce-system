import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerse/controler/favoritcontroller.dart';
import 'package:ecommerse/controler/offercontroller.dart';
import 'package:ecommerse/core/constant/imageassete.dart';
import 'package:ecommerse/core/function/translatedatabase.dart';
import 'package:ecommerse/data/model/itemsmodel.dart';
import 'package:ecommerse/view/widget/priceline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class Customlistitemsoffer extends GetView<Offercontroller> {
  final ItemsModel itemsModel;

  const Customlistitemsoffer({super.key, required this.itemsModel});

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
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Hero(
                    tag: "${itemsModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          AppLink.imagestItems + "/" + itemsModel.itemsImage!,
                      height: 80,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    translateDatabase(
                      itemsModel.itemsNameAr,
                      itemsModel.itemsName,
                    ),
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

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
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "\$ ${itemsModel.itemspricediscount}",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ],
                                )
                                : Text(
                                  "\$ ${itemsModel.itemsPrice}",
                                  style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                      ), // Text(
                      //   "${itemsModel.itemspricediscount}\$",
                      //   style: TextStyle(
                      //     color: Colors.green,
                      //     fontFamily: "sans",
                      //     fontWeight: FontWeight.bold,fontSize: 25
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
                              iconSize: 35,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (itemsModel.itemsDiscount != "0")
              Positioned(
                top: 4,
                left: 4,
                child: Image.asset(AppImageAssets.sale, width: 40),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "%${itemsModel.itemsDiscount}",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
