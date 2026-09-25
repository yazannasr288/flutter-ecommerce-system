import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerse/controler/myfavoritecontroller.dart';
import 'package:ecommerse/core/function/translatedatabase.dart';
import 'package:ecommerse/data/model/myfavoritemodel.dart';
import 'package:ecommerse/view/widget/priceline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class Customlistifavorittems extends GetView<MyFavoritcontroller> {
  final MyFavoriteModel itemsModel;

  const Customlistifavorittems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
               controller.gotopageproductdetailsFromFavorite(itemsModel);

      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "${itemsModel.itemsId}",
                child: CachedNetworkImage(
                  imageUrl: AppLink.imagestItems + "/" + itemsModel.itemsImage!,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10),
              Text(
                translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName),
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                      itemsModel.itemsDiscount
                          .toString(),
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
                          "\$ ${itemsModel.pricediscount}",
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
                  ),
                  // Text(
                  //   "${itemsModel.itemsPrice}\$",
                  //   style: TextStyle(color: Colors.green, fontFamily: "sans"),
                  // ),
                  IconButton(
                    onPressed: () {
                      controller.deleteFromFavorite(itemsModel.favoriteId!);
                    },
                    icon: Icon(Icons.delete_forever_outlined),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
