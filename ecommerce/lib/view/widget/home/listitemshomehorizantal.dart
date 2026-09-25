import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerse/controler/homecontroller.dart';
import 'package:ecommerse/core/function/translatedatabase.dart';
import 'package:ecommerse/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../linkapi.dart';
import '../priceline.dart';

class Listitemshomehorizantal extends GetView<HomecontrollerImp> {
  const Listitemshomehorizantal({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, i) {
        return Itemshome(
          itemsModel: ItemsModel.fromJson(controller.items[i]),
        );
      },
    );
  }
}

class Itemshome extends GetView<HomecontrollerImp> {
  final ItemsModel itemsModel;

  const Itemshome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    final bool hasDiscount =
        (int.tryParse(itemsModel.itemsDiscount.toString()) ?? 0) > 0;

    return InkWell(
      onTap: () {
        controller.gotopageproductdetails(itemsModel);
      },
      borderRadius: BorderRadius.circular(25),
      splashColor: Colors.deepPurple.withOpacity(0.1),
      child: Card(
        color: const Color(0xdd1e1f4b),
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: "${itemsModel.itemsId}",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.imagestItems}/${itemsModel.itemsImage!}",
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Container(height: 150, color: Colors.grey[300]),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.redAccent),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
              const SizedBox(height: 6),
              Expanded(
                child: Text(
                  translateDatabase(itemsModel.itemsDescAr, itemsModel.itemsDesc),
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    height: 1.3,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 5),
              Priceline(
                price: hasDiscount
                    ? Column(
                  children: [
                    Text(
                      "\$ ${double.parse(itemsModel.itemsPrice!).toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.redAccent,
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 2,
                        decorationColor: Colors.yellowAccent,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "\$ ${double.parse(itemsModel.itemspricediscount!).toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
                    : Text(
                  "\$ ${double.parse(itemsModel.itemsPrice!).toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
