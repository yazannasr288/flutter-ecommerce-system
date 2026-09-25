import 'package:ecommerse/controler/itemscontroller.dart';
import 'package:ecommerse/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/function/translatedatabase.dart';

class Listcategoriesitems extends GetView<ItemscontrollerImp> {
  const Listcategoriesitems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel:
            CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemscontrollerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToItems(controller.categories, i!);
        controller.changeCat(i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          GetBuilder<ItemscontrollerImp>(
              builder: (controller) => Container(
                padding:const  EdgeInsets.only(right: 10, left: 10, bottom: 5),
                decoration: controller.selectCat == i
                    ?const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 3, color: AppColor.primaryColor)))
                    : null,
                child: Text(
                  "${translateDatabase(categoriesModel.categories_name_ar, categoriesModel.categories_name)}",
                  style:
                   TextStyle(fontSize: 20, color: AppColor.primaryColor,fontWeight: FontWeight.bold ),
                ),
              ))
        ],
      ),
    );
  }
}
