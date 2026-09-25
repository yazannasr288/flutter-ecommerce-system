import 'package:ecommerse/controler/homecontroller.dart';
import 'package:ecommerse/core/function/translatedatabase.dart';
import 'package:ecommerse/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../linkapi.dart';

class Listcategorieshome extends GetView<HomecontrollerImp> {
  const Listcategorieshome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,

            categoriesModel: CategoriesModel.fromJson(
              controller.categories[index],
            ),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomecontrollerImp> {
  final CategoriesModel categoriesModel;
  final int? i;

  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotoitems(controller.categories, i!,categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.blue[200]),
            padding: EdgeInsets.symmetric(horizontal: 10),

            height: 70,
            width: 70,
            child: SvgPicture.network(
              "${AppLink.imagestCategories}/${categoriesModel.categoriesImage}",
            ),
          ),
          Text(
            "${translateDatabase(categoriesModel.categories_name_ar, categoriesModel.categories_name)}",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
